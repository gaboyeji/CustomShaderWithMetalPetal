//
//  ViewController+ControllerObservableMode.swift
//  CustomShaderWithMetalPetal
//
//  Created by Gregory Aboyeji on 9/10/22.
//

extension ViewController: ControllerObservableMode {
    
    /// Check whether the ViewController is in Foreground or Background Mode
    func setObservable() {
        NotificationCenter
            .default
            .addObserver(
                self,
                selector: #selector(self.inBackground(_:)),
                name: UIApplication.willResignActiveNotification,
                object: nil
            )
        
        NotificationCenter
            .default
            .addObserver(
                self,
                selector: #selector(self.inForeground(_:)),
                name: UIApplication.willEnterForegroundNotification,
                object: nil
            )
        
        NotificationCenter
            .default
            .addObserver(
                self,
                selector: #selector(self.isInActiveForeground(_:)),
                name: UIApplication.didBecomeActiveNotification,
                object: nil
            )
    }
    
    @objc
    func inBackground(_ notification: Notification) {
        self.releaseCamera()
        self.releaseUIElements()
        Debug.message("Current in Background")
    }
    
    @objc
    func inForeground(_ notification: Notification) {
        // Do something if necessary while in active foreground mode
        Debug.message("Will Foreground...")
    }
    
    @objc
    func isInActiveForeground(_ notification: Notification) {
        self.configureCamera()
        self.configureDisplay()
        Debug.message("Foreground active...")
    }
}
