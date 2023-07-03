//
//  AZVideoPlayerStatus.swift
//  AZVideoPlayer
//
//  Created by Adam Zarn on 7/3/23.
//

import Foundation
import AVKit

public struct AZVideoPlayerStatus {
    public let timeControlStatus: AVPlayer.TimeControlStatus
    public let volume: AZVideoPlayer.Volume
}
