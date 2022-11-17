//
//  ListView.swift
//  AZVideoPlayerDemoApp
//
//  Created by Adam Zarn on 7/31/22.
//

import SwiftUI

struct ListView: View {
    var url: URL
    
    var body: some View {
        List {
            DemoVideoPlayer(url: url)
            DemoVideoPlayer(url: url)
            DemoVideoPlayer(url: url)
            DemoVideoPlayer(url: url)
        }
    }
}
