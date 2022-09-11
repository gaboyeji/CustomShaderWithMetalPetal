//
//  ViewController+CameraFeedManager.swift
//  CustomShaderWithMetalPetal
//
//  Created by Gregory Aboyeji on 9/10/22.
//


extension ViewController: CameraFeedManager {
    
    /// Get current Camera frame feed from the camera manager
    /// - Parameter sampleBuffer: raw sampleBuffer from camera manager
    func currentFrameBuffer(sampleBuffer: CMSampleBuffer) {
        
        DispatchQueue.main.async (execute: {
            guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {return}
            var videoFrame = MTIImage(cvPixelBuffer: pixelBuffer, alphaType: .alphaIsOne).withCachePolicy(.transient)
            
            if self.isFiltered {
                videoFrame = self.activateDistortFilter(videoFrame)
            }
            
            // This simple unwrap guaranteed that the image feed does not
            // freeze when resuming from background to foreground
            guard let renderView = self.renderView else { return }
            renderView.image = videoFrame
        })
    }
}
