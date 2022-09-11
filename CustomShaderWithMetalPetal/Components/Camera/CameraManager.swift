//
//  CameraManager.swift
//  CustomShaderWithMetalPetal
//
//  Created by Gregory Aboyeji on 9/10/22.
//

import Foundation
import CoreMedia

enum CameraPosition {
    case front, back
}

enum CameraState {
    case inActive, active, background, foreground, interrupted
}

enum ErrorString: Error {
    case FoundNil(String)
}


enum CameraPreset {
    case vga640x480, hd1280x720, hd1920x1080
    
    var quality: AVCaptureSession.Preset {
        switch self {
        case .vga640x480:
            return AVCaptureSession.Preset.vga640x480
        case .hd1280x720:
            return AVCaptureSession.Preset.hd1280x720
        case .hd1920x1080:
            return AVCaptureSession.Preset.hd1920x1080
        }
    }
}

enum CameraPixelType {
    case bgra, planar
    
    var format: [String: Any] {
        switch self {
        case .bgra:
            return [kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA]
        case .planar:
            return [kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_420YpCbCr8PlanarFullRange]
        }
    }
}


protocol CameraFeedManager: AnyObject {
    func currentFrameBuffer(sampleBuffer: CMSampleBuffer)
}
