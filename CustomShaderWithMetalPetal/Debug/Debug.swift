//
//  Debug.swift
//  CustomShaderWithMetalPetal
//
//  Created by Gregory Aboyeji on 9/10/22.
//

import Foundation

final class Debug {
    
    /// Print debug info with filename, line number, function and custom message
    /// - Parameters:
    ///   - message: custom message
    ///   - function: function
    ///   - file: filename
    ///   - line: line number
    class func message(_ message: String, function: String = #function, file: String = #file, line: Int = #line) {
        var filename = file
        if let match = filename.range(of: "[^/]*$", options: .regularExpression) {
            filename = String(filename[match])
        }
        print("\(Date().timeIntervalSince1970):\(filename):L\(line):\(function) \"\(message)\"")
    }
    
}
