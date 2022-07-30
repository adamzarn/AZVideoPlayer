//
//  ContentView.swift
//  AZVideoPlayerDemoApp
//
//  Created by Adam Zarn on 7/30/22.
//

import SwiftUI
import AVKit
import AZVideoPlayer

struct ContentView: View {
    var player: AVPlayer?
    @State var willBeginFullScreenPresentation: Bool = false
    
    init(url: URL) {
        self.player = AVPlayer(url: url)
    }
    
    var body: some View {
        AZVideoPlayer(player: player,
                      willBeginFullScreenPresentationWithAnimationCoordinator: willBeginFullScreen,
                      willEndFullScreenPresentationWithAnimationCoordinator: willEndFullScreen)
        .aspectRatio(16/9, contentMode: .fit)
        .onDisappear {
            // onDisappear is called when full screen presentation begins, but the view is
            // not actually disappearing in this case so we don't want to reset the player
            guard !willBeginFullScreenPresentation else {
                willBeginFullScreenPresentation = false
                return
            }
            player?.pause()
            player?.seek(to: .zero)
        }
    }
    
    func willBeginFullScreen(_ playerViewController: AVPlayerViewController,
                             _ coordinator: UIViewControllerTransitionCoordinator) {
        willBeginFullScreenPresentation = true
    }
    
    func willEndFullScreen(_ playerViewController: AVPlayerViewController,
                           _ coordinator: UIViewControllerTransitionCoordinator) {
        // This is a static helper method provided by AZVideoPlayer to keep
        // the video playing if it was playing when full screen presentation ended
        AZVideoPlayer.continuePlayingIfPlaying(player, coordinator)
    }
}
