//
//  MainTabView.swift
//  AZVideoPlayerDemoApp
//
//  Created by Adam Zarn on 7/31/22.
//

import SwiftUI
import AZVideoPlayer

struct MainTabView: View {
    var body: some View {
        TabView {
            DemoVideoPlayer(url: URL(string: "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!,
                            statusDidChange: statusDidChange).tabItem {
                Image(systemName: "")
                Text("Basic")
            }
            VStackView(url: URL(string: "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!).tabItem {
                Image(systemName: "")
                Text("VStack")
            }
            
            ListView(url: URL(string: "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!).tabItem {
                Image(systemName: "")
                Text("List")
            }
            LazyVStackView(url: URL(string: "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!).tabItem {
                Image(systemName: "")
                Text("LazyVStack")
            }
            SheetView(url: URL(string: "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!).tabItem {
                Image(systemName: "")
                Text("Sheet")
            }
        }
    }
    
    func statusDidChange(_ status: AZVideoPlayerStatus) {
        print(status.timeControlStatus.rawValue)
        print(status.volume)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
