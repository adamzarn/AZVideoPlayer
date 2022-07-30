//
//  AZVideoPlayerDemoApp.swift
//  AZVideoPlayerDemoApp
//
//  Created by Adam Zarn on 7/30/22.
//

import SwiftUI

@main
struct AZVideoPlayerDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(url: URL(string: "https://bit.ly/swswift")!)
        }
    }
}
