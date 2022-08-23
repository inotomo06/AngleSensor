//
//  ContentViewModel.swift
//  AngleSensor
//
//  Created by cmStudent on 2022/07/28.
//

import Foundation

final class ContentViewModel: ObservableObject {
    
    private let motionManager = MotionManager.shared
    
    @Published var isShowSheet = false;
    
    @Published var roll = 0.0
    @Published var yaw = 0.0
    
    func angle() {
        (roll, yaw) = motionManager.startUpdates()
    }
}
