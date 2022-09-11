//
//  ControllerObservableMode.swift
//  CustomShaderWithMetalPetal
//
//  Created by Gregory Aboyeji on 9/10/22.
//

protocol ControllerObservableMode: AnyObject {
    func setObservable()
    func inForeground(_ notification: Notification)
    func inBackground(_ notification: Notification)
    func isInActiveForeground(_ notification: Notification)
}
