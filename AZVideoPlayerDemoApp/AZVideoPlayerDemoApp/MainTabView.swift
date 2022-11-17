//
//  MainTabView.swift
//  AZVideoPlayerDemoApp
//
//  Created by Adam Zarn on 7/31/22.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            DemoVideoPlayer(url: URL(string: "https://bit.ly/swswift")!).tabItem {
                Image(systemName: "")
                Text("Basic")
            }
            VStackView(url: URL(string: "https://bit.ly/swswift")!).tabItem {
                Image(systemName: "")
                Text("VStack")
            }
            
            ListView(url: URL(string: "https://bit.ly/swswift")!).tabItem {
                Image(systemName: "")
                Text("List")
            }
            LazyVStackView(url: URL(string: "https://bit.ly/swswift")!).tabItem {
                Image(systemName: "")
                Text("LazyVStack")
            }
            SheetView(url: URL(string: "https://bit.ly/swswift")!).tabItem {
                Image(systemName: "")
                Text("Sheet")
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
