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
            DemoVideoPlayer(url: url)
            Spacer()
        }
    }
}
