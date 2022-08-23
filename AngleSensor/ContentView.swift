//
//  ContentView.swift
//  AngleSensor
//
//  Created by cmStudent on 2022/07/28.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var contentViewModel = ContentViewModel()
//    let motion = MotionManager.shared
    var body: some View {
        Text("\(contentViewModel.roll)")
        Text("\(contentViewModel.yaw)")
        
        Button {
            contentViewModel.angle()
        } label: {
            Text("ANGLE")
                .font(.title)
                .border(.black, width: 2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
