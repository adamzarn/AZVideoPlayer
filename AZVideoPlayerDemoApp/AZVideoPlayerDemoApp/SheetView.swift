//
//  SheetView.swift
//  AZVideoPlayerDemoApp
//
//  Created by Adam Zarn on 8/1/22.
//

import SwiftUI

struct SheetView: View {
    @State var sheetIsPresented: Bool = false
    @State var fullScreenCoverIsPresented: Bool = false
    var url: URL
    
    var body: some View {
        VStack(spacing: 16) {
            Button(action: {
                self.sheetIsPresented = true
            }, label: {
                Text("Present Sheet")
            })
            Button(action: {
                self.fullScreenCoverIsPresented = true
            }, label: {
                Text("Present Full Screen Cover")
            })
        }
        .sheet(isPresented: $sheetIsPresented, content: {
            DemoVideoPlayer(url: url)
        })
        .fullScreenCover(isPresented: $fullScreenCoverIsPresented, content: {
            DemoVideoPlayer(url: url)
        })
    }
}
