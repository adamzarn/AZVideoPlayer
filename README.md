# AZVideoPlayer

The `VideoPlayer` provided by `SwiftUI` out of the box is great but it's missing one very important feature: full screen presentation mode. `AZVideoPlayer` behaves pretty much exactly like `VideoPlayer`, but adds the button that's provided by `AVPlayerViewController` to go full screen.

### Basic Usage

```swift
import SwiftUI
import AVKit
import AZVideoPlayer

struct ContentView: View {
    var player: AVPlayer?
    
    init(url: URL) {
        self.player = AVPlayer(url: url)
    }
    
    var body: some View {
        AZVideoPlayer(player: player)
    }
}
```

### Advanced Usage

I had a couple more reasons for making this package:
1. Make it easy to reset the video player when the view disappears.
2. Have the video continue playing when ending full screen presentation (it defaults to pausing when full screen mode ends).

Here's an example of how `AZVideoPlayer` can be used to do that:

```swift
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
        .onDisappear {
            // onDisappear is called when full screen presentation begins, but the view is
            // not actually disappearing in this case so we don't want to reset the player
            guard !willBeginFullScreenPresentation else {
                willBeginFullScreenPresentation = false
                return
            }
            player?.reset()
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
```
