//
//  DemoVideoPlayer.swift
//  AZVideoPlayerDemoApp
//
//  Created by Adam Zarn on 7/30/22.
//

import SwiftUI
import AVKit
import AZVideoPlayer

struct DemoVideoPlayer: View {
    var player: AVPlayer?
    let statusDidChange: AZVideoPlayer.StatusDidChange?
    @State var willBeginFullScreenPresentation: Bool = false
    
    init(url: URL, statusDidChange: AZVideoPlayer.StatusDidChange? = nil) {
        self.player = AVPlayer(url: url)
        self.statusDidChange = statusDidChange
    }
    
    var body: some View {
        VStack {
            AZVideoPlayer(player: player,
                          willBeginFullScreenPresentationWithAnimationCoordinator: willBeginFullScreen,
                          willEndFullScreenPresentationWithAnimationCoordinator: willEndFullScreen,
                          statusDidChange: statusDidChange,
                          showsPlaybackControls: true,
                          entersFullScreenWhenPlaybackBegins: true,
                          pausesWhenFullScreenPlaybackEnds: false)
            .aspectRatio(16/9, contentMode: .fit)
            .shadow(color: .white, radius: 2)
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
            Button(action: {
                player?.play()
            }, label: {
                Text("Play")
            })
        }
    }
    
    func willBeginFullScreen(_ playerViewController: AVPlayerViewController,
                             _ coordinator: UIViewControllerTransitionCoordinator) {
        willBeginFullScreenPresentation = true
    }
    
    func willEndFullScreen(_ playerViewController: AVPlayerViewController,
                           _ coordinator: UIViewControllerTransitionCoordinator) {
    }
}
