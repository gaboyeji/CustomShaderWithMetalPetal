//
//  ViewController.swift
//  CustomShaderWithMetalPetal
//
//  Created by Gregory Aboyeji on 9/10/22.
//

import UIKit



final class ViewController: UIViewController {

    public var renderView: MTIImageView?
    private var context: MTIContext?
    private var camera: Camera?
    public var isFiltered: Bool = false
    public var isCameraBack: Bool = false
    
    // Distortion Filter
    private let distortFilter = GADistortFilter()
    
    lazy var btnFilter: UIButton = {
        let w: CGFloat = 120
        let h: CGFloat = 50
        let x: CGFloat = 20
        let y: CGFloat = (SCREEN_SIZE.height-(h+30))
        let v = UIButton(frame: CGRect(x: x, y: y, width: w, height: h))
        v.setTitle("Filter: OFF", for: .normal)
        v.setTitleColor(.black, for: .normal)
        v.backgroundColor = .white
        v.layer.masksToBounds = true
        v.layer.borderWidth = 1
        v.layer.borderColor = UIColor.black.cgColor
        v.addTarget(self, action: #selector(self.didTapFilter), for: .touchUpInside)
        return v
    }()
    
    lazy var btnFlipCamera: UIButton = {
        let w: CGFloat = 120
        let h: CGFloat = 50
        let x: CGFloat = (SCREEN_SIZE.width-(w+20))
        let y: CGFloat = (SCREEN_SIZE.height-(h+30))
        let v = UIButton(frame: CGRect(x: x, y: y, width: w, height: h))
        v.setTitle("Cam: FRONT", for: .normal)
        v.setTitleColor(.black, for: .normal)
        v.backgroundColor = .white
        v.layer.masksToBounds = true
        v.layer.borderWidth = 1
        v.layer.borderColor = UIColor.black.cgColor
        v.addTarget(self, action: #selector(self.didTapFlipCamera), for: .touchUpInside)
        return v
    }()
    
    private func configureDisplayContext() {
        do {
            self.context = try MTIContext(device: MTLCreateSystemDefaultDevice()!)
        } catch let error {
            Debug.message("ERROR: MTIContext not initialized - \(error)")
        }
        
        self.configureDisplay()
    }
    
    public func configureDisplay() {
        self.renderView = MTIImageView(frame: view.frame)
        self.renderView!.context = self.context!
        self.configureUIElements()
    }
    
    public func configureUIElements() {
        view.addSubview(renderView!)
        view.addSubview(btnFilter)
        view.addSubview(btnFlipCamera)
    }
    
    public func configureCamera(_ cameraPosition: CameraPosition = .front) {
        self.configureDisplayContext()
        
        self.camera = Camera(
            preset: CameraPreset.hd1280x720.quality,
            position: cameraPosition,
            frameFeedDelegate: self,
            pixelFormat: CameraPixelType.bgra.format
        )
        let cameraBufferQueue = DispatchQueue(label: "com.example.cameraBufferQueue", qos: .utility)
        
        self.camera!.enableVideoDataOutput(on: cameraBufferQueue)
        self.camera!.sessionStart()
    }
    
    public func releaseCamera() {
        self.camera!.sessionStop()
        self.camera = nil
        self.context = nil
        //Debug.message("releasing camera")
    }
    
    
    /// Removing the UI element guarantees that upon the ViewController
    /// entering the foreground will show the previous image feed.
    /// Though, this could handled more elegantly but simple example
    /// this is sufficient.
    public func releaseUIElements() {
        self.renderView!.removeFromSuperview()
        self.renderView = nil
        self.btnFilter.removeFromSuperview()
        self.btnFlipCamera.removeFromSuperview()
        Debug.message("releasing UI elements")
    }
    
    @objc
    func didTapFilter() {
        if self.isFiltered {
            self.isFiltered = false
            self.btnFilter.setTitle("Filter: OFF", for: .normal)
            self.btnFilter.setTitleColor(.black, for: .normal)
            self.btnFilter.backgroundColor = .white
            
            Debug.message(" no filter ")
        } else {
            self.isFiltered = true
            self.btnFilter.setTitle("Filter: ON", for: .normal)
            self.btnFilter.setTitleColor(.white, for: .normal)
            self.btnFilter.backgroundColor = .red
            Debug.message(" filter active ")
        }
    }
    
    @objc
    func didTapFlipCamera() {
        if self.isCameraBack {
            self.isCameraBack = false
            self.releaseCamera()
            self.configureCamera()
            self.btnFlipCamera.setTitle("Cam: FRONT", for: .normal)
            self.btnFlipCamera.setTitleColor(.black, for: .normal)
            self.btnFlipCamera.backgroundColor = .white
            Debug.message(" camera view BACK ")
        } else {
            self.isCameraBack = true
            self.releaseCamera()
            self.configureCamera(.back)
            self.btnFlipCamera.setTitle("Cam: BACK", for: .normal)
            self.btnFlipCamera.setTitleColor(.white, for: .normal)
            self.btnFlipCamera.backgroundColor = .blue
            Debug.message(" camera view FRONT ")
        }
    }
    
    func activateDistortFilter(_ inputBuffer: MTIImage) -> MTIImage {
        
        let w: CGFloat = SCREEN_SIZE.width
        let h: CGFloat = SCREEN_SIZE.height
        let px: CGFloat = w/2
        let py: CGFloat = h/2
        
        // CameraAttribute
        let ca = self.camera!.getCameraAttribute()
        let _w: CGFloat = CGFloat(ca.height)
        let _h: CGFloat = CGFloat(ca.width)
        
        // Setting distortion point to center of frame
        let x = (px/w)*_w
        let y = (py/h)*_h
        let distortionPoints = SIMD2<Float>(x: Float(x), y: Float(y))
        
        self.distortFilter.distortParameters = DistortionParameters(point: distortionPoints, radius: 150, direction: .pi, strength: 130, density: 1, width: Float(ca.height), height: Float(ca.width))
        
        self.distortFilter.inputImage = inputBuffer        
        return self.distortFilter.outputImage!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.setObservable()
        self.configureCamera()
        
        view.backgroundColor = .black
        
        // Simple description of current class
        let className = String(describing: type(of: self))
        Debug.message("Loaded: \(className)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("disappear")
    }


}





