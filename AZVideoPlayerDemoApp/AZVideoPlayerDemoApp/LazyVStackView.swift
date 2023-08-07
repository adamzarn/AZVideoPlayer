//
//  LazyVStackView.swift
//  AZVideoPlayerDemoApp
//
//  Created by Adam Zarn on 7/31/22.
//

import SwiftUI

struct LazyVStackView: View {
    var url: URL
    
    var body: some View {
        ScrollView {
            LazyVStack {
                DemoVideoPlayer(url: url)
                Text("HELLO").padding(100)
                DemoVideoPlayer(url: url)
                Text("HELLO").padding(100)
                DemoVideoPlayer(url: url)
                DemoVideoPlayer(url: url)
                Text("HELLO").padding(100)
                DemoVideoPlayer(url: url)
                Text("HELLO").padding(100)
                DemoVideoPlayer(url: url)
            }
        }
    }
}
