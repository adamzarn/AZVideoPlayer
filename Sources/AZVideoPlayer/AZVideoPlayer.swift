//
//  AZVideoPlayer.swift
//  AZVideoPlayer
//
//  Created by Adam Zarn on 7/4/22.
//

import Foundation
import SwiftUI
import AVKit

public struct AZVideoPlayer: UIViewControllerRepresentable {
    public typealias TransitionCompletion = (
        AVPlayerViewController, UIViewControllerTransitionCoordinator
    ) -> Void
    public typealias Volume = Float
    public typealias StatusDidChange = (AZVideoPlayerStatus) -> Void
    
    let player: AVPlayer?
    let showsPlaybackControls: Bool
    let willBeginFullScreenPresentationWithAnimationCoordinator: TransitionCompletion?
    let willEndFullScreenPresentationWithAnimationCoordinator: TransitionCompletion?
    let statusDidChange: StatusDidChange?
    
    public init(player: AVPlayer?,
                willBeginFullScreenPresentationWithAnimationCoordinator: TransitionCompletion? = nil,
                willEndFullScreenPresentationWithAnimationCoordinator: TransitionCompletion? = nil,
                statusDidChange: StatusDidChange? = nil,
                showsPlaybackControls: Bool = true) {
        self.player = player
        self.showsPlaybackControls = showsPlaybackControls
        self.willBeginFullScreenPresentationWithAnimationCoordinator = willBeginFullScreenPresentationWithAnimationCoordinator
        self.willEndFullScreenPresentationWithAnimationCoordinator = willEndFullScreenPresentationWithAnimationCoordinator
        self.statusDidChange = statusDidChange
    }

    public func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = showsPlaybackControls
        controller.delegate = context.coordinator
        return controller
    }
    
    public func updateUIViewController(_ controller: AVPlayerViewController, context: Context) {
        controller.player = player
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(self, statusDidChange)
    }
    
    public final class Coordinator: NSObject, AVPlayerViewControllerDelegate {
        var parent: AZVideoPlayer
        var statusDidChange: StatusDidChange?
        var timeControlStatusObservation: NSKeyValueObservation?
     
        init(_ parent: AZVideoPlayer,
             _ statusDidChange: StatusDidChange? = nil) {
            self.parent = parent
            self.statusDidChange = statusDidChange
            self.timeControlStatusObservation = self.parent.player?.observe(\.timeControlStatus,
                                                                             changeHandler: { player, _ in
                statusDidChange?(AZVideoPlayerStatus(timeControlStatus: player.timeControlStatus, volume: player.volume))
            })
        }
        
        public func playerViewController(_ playerViewController: AVPlayerViewController,
                                         willBeginFullScreenPresentationWithAnimationCoordinator coordinator: UIViewControllerTransitionCoordinator) {
            parent.willBeginFullScreenPresentationWithAnimationCoordinator?(playerViewController, coordinator)
        }
        
        public func playerViewController(_ playerViewController: AVPlayerViewController,
                                         willEndFullScreenPresentationWithAnimationCoordinator coordinator: UIViewControllerTransitionCoordinator) {
            parent.willEndFullScreenPresentationWithAnimationCoordinator?(playerViewController, coordinator)
        }
    }
    
    public static func continuePlayingIfPlaying(_ player: AVPlayer?,
                                                _ coordinator: UIViewControllerTransitionCoordinator) {
        let isPlaying = player?.isPlaying ?? false
        coordinator.animate(alongsideTransition: nil) { _ in
            if isPlaying {
                player?.play()
            }
        }
    }
}
