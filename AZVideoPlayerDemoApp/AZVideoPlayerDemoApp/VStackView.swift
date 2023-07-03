//
//  VStackView.swift
//  AZVideoPlayerDemoApp
//
//  Created by Adam Zarn on 7/31/22.
//

import SwiftUI
import AVKit
import AZVideoPlayer

struct VStackView: View {
    var url: URL
    
    var body: some View {
        VStack {
            DemoVideoPlayer(url: url, statusDidChange: { (videoPlayerStatus) in
                let status: String
                switch videoPlayerStatus.timeControlStatus {
                case .paused: status = "paused"
                case .playing: status = "playing"
                case .waitingToPlayAtSpecifiedRate: status = "waitingToPlayAtSpecifiedRate"
                @unknown default: status = "unknown"
                }
                print("Status:", status, "Volume:", videoPlayerStatus.volume)
            })
            Spacer()
        }
    }
}
