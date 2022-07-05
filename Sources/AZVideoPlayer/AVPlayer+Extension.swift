//
//  AVPlayer+Extension.swift
//  
//
//  Created by Adam Zarn on 7/5/22.
//

import AVKit

extension AVPlayer {
    var isPlaying: Bool {
        return rate != 0 && error == nil
    }
}
