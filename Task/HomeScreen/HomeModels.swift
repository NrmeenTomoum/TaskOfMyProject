//
//  HomeModels.swift
//  Task
//
//
//  Created by Nrmeen Tomoum on 12/01/2020.
//  Copyright © 2020 Nermeen. All rights reserved.
//

import UIKit

class Video: NSObject {
  let url: URL
  let thumbURL: String
  let title: String
  let subtitle: String

  init(url: URL, thumbURL: String, title: String, subtitle: String) {
    self.url = url
    self.thumbURL = thumbURL
    self.title = title
    self.subtitle = subtitle
    super.init()
  }
    
  class func allVideos() -> [Video] {
    var videos: [Video] = []
    let titles = ["jwplatform", "akamaihd", "telequebec", "bitdash"]
     let subtitles = ["https://content.jwplatform.com/manifests/yp34SRmf.m3u8",
                     "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8",
                     "https://mnmedias.api.telequebec.tv/m3u8/29880.m3u8",
"https://bitdash-a.akamaihd.net/content/MI201109210084_1/m3u8s/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.m3u8"]
    
    for (index, urlName) in subtitles.enumerated() {
        let url = URL(string: urlName)!
      let thumbURL =  urlName
      let video = Video(url: url, thumbURL: thumbURL, title: titles[index], subtitle: subtitles[index])
      videos.append(video)
    }
    return videos
  }
  
//  class func allVideos() -> [Video] {
//    var videos = localVideos()
//
//    // Add one remote video
//    let videoURLString = "https://wolverine.raywenderlich.com/content/ios/tutorials/video_streaming/foxVillage.m3u8"
//    if let url = URL(string: videoURLString) {
//      let thumbURLPath = Bundle.main.path(forResource: "foxVillage", ofType: "png")!
//      let thumbURL = URL(fileURLWithPath: thumbURLPath)
//      let remoteVideo = Video(url: url, thumbURL: thumbURL, title: "キツネ村", subtitle: "Will we be mauled by vicious foxes? Tune in to find out!")
//      videos.append(remoteVideo)
//    }
//
//    return videos
//  }
}


class VideoClip: NSObject {
  let url: URL
  
  init(url: URL) {
    self.url = url
    super.init()
  }
  
//  class func allClips() -> [VideoClip] {
//    var clips: [VideoClip] = []
//
////    // Add HLS Stream to the beginning of clip show
////    if let url = URL(string: "https://wolverine.raywenderlich.com/content/ios/tutorials/video_streaming/foxVillage.m3u8") {
////      let remoteVideo = VideoClip(url: url)
////      clips.append(remoteVideo)
////    }
//            let titles = ["https://content.jwplatform.com/manifests/yp34SRmf.m3u8",
//                         "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8",
//                         "https://mnmedias.api.telequebec.tv/m3u8/29880.m3u8",
//    "https://bitdash-a.akamaihd.net/content/MI201109210084_1/m3u8s/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.m3u8"]
//           for title in titles {
//            let url = URL(string: title)!
//
//      let clip = VideoClip(url: url)
//      clips.append(clip)
//    }
//
//    return clips
//  }
}
