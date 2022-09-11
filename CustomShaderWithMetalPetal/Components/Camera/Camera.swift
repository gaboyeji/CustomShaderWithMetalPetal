//
//  Camera.swift
//  CustomShaderWithMetalPetal
//
//  Created by Gregory Aboyeji on 9/10/22.
//

import AVFoundation
import CoreMedia

struct CameraAttribute {
    var width: Int = 0
    var height: Int = 0
    var position: CameraPosition
}

final class Camera: NSObject {
    
    deinit {
        let className = String(describing: type(of: self))
        Debug.message(" \(className) released from memory")
    }
    
    let queue = DispatchQueue(label: "com.pixpixapp.paperstore", attributes: [])
    
    private var deviceInput: AVCaptureDeviceInput?
    private var deviceZoomFactor: CGFloat = 1.0
    
    private var captureDevice: AVCaptureDevice?
    private var videoCaptureDeviceInput: AVCaptureDeviceInput?
    private var videoDataOutput: AVCaptureVideoDataOutput?
    private var videoSettings: [String: Any] = [:]
    
    private var session: AVCaptureSession?
    private let position: CameraPosition
    private var cameraAttribute: CameraAttribute = CameraAttribute(position: .back)
    weak private var frameFeedDelegate: CameraFeedManager?
    
    init(preset: AVCaptureSession.Preset, position: CameraPosition = .back, frameFeedDelegate: CameraFeedManager, pixelFormat: [String: Any] ) {
        
        self.session = AVCaptureSession()
        self.position = position
        self.frameFeedDelegate = frameFeedDelegate
        self.videoSettings = pixelFormat
        
        self.session!.beginConfiguration()
        
        if session!.canSetSessionPreset(preset) {
            session?.sessionPreset = preset
        }

        self.session!.commitConfiguration()
        super.init()
        
        // Without the use of the keyword defer
        // didSet will not get called
        // https://stackoverflow.com/questions/25230780/is-it-possible-to-allow-didset-to-be-called-during-initialization-in-swift
        defer { self.usePosition = position }
    }
    
    var usePosition: CameraPosition = .back {
        didSet {
            var position: AVCaptureDevice.Position = AVCaptureDevice.Position.back
            
            if usePosition == .front { position = .front }
            
            guard let device = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: .video, position: position).devices.first else {
              return
            }
            
            if device.hasMediaType(AVMediaType.video) && device.position == position {
                do {
                    try device.lockForConfiguration()
                    if device.isFocusModeSupported(.continuousAutoFocus) {
                        device.focusMode = .continuousAutoFocus
                    }
                    if device.isLowLightBoostSupported {
                        device.automaticallyEnablesLowLightBoostWhenAvailable = true
                    }
                    device.automaticallyAdjustsVideoHDREnabled = true
                    device.unlockForConfiguration()
                    self.captureDevice = device

                    self.session!.beginConfiguration()

                    let videoInput = try AVCaptureDeviceInput(device: device)
                    if let currentVideoCaptureDeviceInput = self.deviceInput {
                        self.session!.removeInput(currentVideoCaptureDeviceInput)
                    }

                    if self.session!.canAddInput(videoInput) {
                        self.session!.addInput(videoInput)
                        self.deviceInput = videoInput
                    }

                    self.session!.commitConfiguration()
                    //self.configureVideoOrientation()
                } catch {
                    fatalError("Cannot configure video device: \(device)")
                }
            }
        }
    }
    
    func enableVideoDataOutput(on queue: DispatchQueue = .main) {
        
        self.session!.beginConfiguration()
        
        defer { self.session!.commitConfiguration() }
        
        if let output = self.videoDataOutput { self.session!.removeOutput(output) }
        
        let videoDataOutput = AVCaptureVideoDataOutput()
        videoDataOutput.videoSettings = self.videoSettings
        videoDataOutput.alwaysDiscardsLateVideoFrames = true
        videoDataOutput.setSampleBufferDelegate(self, queue: queue)
        if self.session!.canAddOutput(videoDataOutput) {
            self.session!.addOutput(videoDataOutput)
            self.videoDataOutput = videoDataOutput
        }

        self.cameraAttribute.width = (videoDataOutput.videoSettings["Width"] as! Int?)!
        self.cameraAttribute.height = (videoDataOutput.videoSettings["Height"] as! Int?)!
        self.configureVideoOrientation()
    }
    
    private func configureVideoOrientation() {
        
        if let videoConnection = self.videoDataOutput?.connection(with: .video) {
            videoConnection.videoOrientation = .portrait
            if self.captureDevice!.position == .front && self.position == .front {
                videoConnection.isVideoMirrored = true
            }
        }
        Debug.message("ok")
    }
    
    func sessionStart() {
        if !self.session!.isRunning { self.session!.startRunning() }
        Debug.message("camera running...")
    }
    
    func sessionStop() {
        if self.session!.isRunning { self.session!.stopRunning() }
        Debug.message("camera stopped")
    }
    
    func getCameraAttribute() -> CameraAttribute {
        return self.cameraAttribute
    }
    
}

// Delegate: AVCaptureVideoDataOutputSampleBufferDelegate
extension Camera: AVCaptureVideoDataOutputSampleBufferDelegate {
        
    /// Replace current pixelBuffer with sampleBuffer
    /// - Parameters:
    ///   - sampleBuffer: current sampleBuffer to be replaced
    ///   - imageBuffer: current pixelBuffer to be replaced
    /// - Returns: Replaced sampleBuffer
    public func sampleBufferByReplacingImageBuffer(sampleBuffer: CMSampleBuffer?, imageBuffer: CVPixelBuffer?) -> CMSampleBuffer? {
        
        let timingInfo = UnsafeMutablePointer<CMSampleTimingInfo>.allocate(capacity: 1)
        CMSampleBufferGetSampleTimingInfo(sampleBuffer!, at: 0, timingInfoOut: timingInfo)
        
        var outputSampleBuffer: CMSampleBuffer? = nil
        var formatDescription: CMFormatDescription?
        CMVideoFormatDescriptionCreateForImageBuffer(allocator: kCFAllocatorDefault, imageBuffer: imageBuffer!, formatDescriptionOut: &formatDescription)
        CMSampleBufferCreateReadyWithImageBuffer(allocator: kCFAllocatorDefault, imageBuffer: imageBuffer!, formatDescription: formatDescription!, sampleTiming: timingInfo, sampleBufferOut: &outputSampleBuffer)
        
        return (outputSampleBuffer)!
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        
        let formatDescription = CMSampleBufferGetFormatDescription(sampleBuffer)
            
        if CMFormatDescriptionGetMediaType(formatDescription!) == kCMMediaType_Video {
            self.frameFeedDelegate?.currentFrameBuffer(sampleBuffer: sampleBuffer)
        }
 
        
    }
}






