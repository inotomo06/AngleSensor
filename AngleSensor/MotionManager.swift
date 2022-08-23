//
//  MotionManager.swift
//  AngleSensor
//
//  Created by cmStudent on 2022/07/28.
//

import Foundation
import CoreMotion

final class MotionManager {
    static let shared: MotionManager = .init()
    
    private let motion = CMMotionManager()
    private let queue = OperationQueue()
    
    var roll = 0.0
    var yaw = 0.0
    
    var attitude = CMAttitude()
    
    private init() {
        
    }
    
    func startUpdates() -> (Double, Double) {
        guard motion.isDeviceMotionAvailable else {
            return (0, 0)
        }
        
        motion.deviceMotionUpdateInterval = 1.0 / 60.0
        motion.showsDeviceMovementDisplay = true
        
        motion.startDeviceMotionUpdates(using: .xMagneticNorthZVertical, to: queue) { data, error in
            
            if let validData = data {
                
                self.roll = validData.attitude.roll
                self.yaw = validData.attitude.yaw
            }
        }
        
        return (roll, yaw)
    }
}

