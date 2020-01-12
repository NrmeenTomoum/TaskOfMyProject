//
//  VedioLooderView.swift
//  Task
//
//  Created by Nrmeen Tomoum on 12/01/2020.
//  Copyright © 2020 Nermeen. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class VideoLooperView: UIView {
  let videoPlayerView = VideoPlayerView()
    var videoURl : URL?
  // 9 Add player
    @objc private var player = AVPlayer()
  private var token: NSKeyValueObservation?

  init(video: Video) {
    videoURl = video.url
    super.init(frame: .zero)
    
    // 10 Set up the player
    initializePlayer()
    addGestureRecognizers()
  }
  
  // 10 Set up player
  private func initializePlayer() {
 
    player = AVPlayer(url: videoURl!)
    
    videoPlayerView.player = player
    
    player.volume = 0.0
    player.play()
    
 //   token = player.observe(\.currentItem) { [weak self] player, _ in
//      if player.items().count == 1 {
//        self?.addAllVideosToPlayer()
//      }
  //  }
  }
  
//  // 11 Create player items from video URLs and insert them into the player's list
//  private func addAllVideosToPlayer() {
//    for video in clips {
//      let asset = AVURLAsset(url: video.url)
//      let item = AVPlayerItem(asset: asset)
//      player.insert(item, after: player.items().last)
//    }
//  }
//
  // 12 Add methods to pause and play when the view leaves the screen
  func pause() {
    player.pause()
  }

  func play() {
    player.play()
  }
  
  // MARK - Gestures
  
  // 13 Add single and double tap gestures to the video looper
  func addGestureRecognizers() {
    // 1
    let tap = UITapGestureRecognizer(target: self, action: #selector(VideoLooperView.wasTapped))
    let doubleTap = UITapGestureRecognizer(target: self,
                                           action: #selector(VideoLooperView.wasDoubleTapped))
    doubleTap.numberOfTapsRequired = 2
    
    // 2
    tap.require(toFail: doubleTap)

    // 3
    addGestureRecognizer(tap)
    addGestureRecognizer(doubleTap)
  }
  
  // 13a Single tapping should toggle the volume
  @objc func wasTapped() {
    player.volume = player.volume == 1.0 ? 0.0 : 1.0
  }
  
  // 13b Double tapping should toggle the rate between 2x and 1x
  @objc func wasDoubleTapped() {
    player.rate = player.rate == 1.0 ? 2.0 : 1.0
  }
  
  // MARK - Unnecessary Code
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
