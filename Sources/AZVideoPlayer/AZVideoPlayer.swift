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
    
    let player: AVPlayer?
    let showsPlaybackControls: Bool
    let willBeginFullScreenPresentationWithAnimationCoordinator: TransitionCompletion?
    let willEndFullScreenPresentationWithAnimationCoordinator: TransitionCompletion?
    
    public init(player: AVPlayer?,
                willBeginFullScreenPresentationWithAnimationCoordinator: TransitionCompletion? = nil,
                willEndFullScreenPresentationWithAnimationCoordinator: TransitionCompletion? = nil,
                showsPlaybackControls: Bool = true) {
        self.player = player
        self.showsPlaybackControls = showsPlaybackControls
        self.willBeginFullScreenPresentationWithAnimationCoordinator = willBeginFullScreenPresentationWithAnimationCoordinator
        self.willEndFullScreenPresentationWithAnimationCoordinator = willEndFullScreenPresentationWithAnimationCoordinator
    }

    public func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = showsPlaybackControls
        controller.delegate = context.coordinator
        return controller
    }
    
    public func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    public final class Coordinator: NSObject, AVPlayerViewControllerDelegate {
        var parent: AZVideoPlayer
     
        init(_ parent: AZVideoPlayer) {
            self.parent = parent
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
