//
//  AVPlayerViewController+Extension.swift
//
//
//  Created by Adam Zarn on 7/5/22.
//

import AVKit

extension AVPlayerViewController {
    func enterFullScreenPresentation(animated: Bool) {
        perform(NSSelectorFromString("enterFullScreenAnimated:completionHandler:"), with: animated, with: nil)
    }
    func exitFullScreenPresentation(animated: Bool) {
        perform(NSSelectorFromString("exitFullScreenAnimated:completionHandler:"), with: animated, with: nil)
    }
}
