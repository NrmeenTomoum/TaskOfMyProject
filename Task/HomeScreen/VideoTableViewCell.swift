//
//  TableViewVedioCell.swift
//  Task
//
//  Created by Nrmeen Tomoum on 12/01/2020.
//  Copyright © 2020 Nermeen. All rights reserved.
//

import UIKit
import AVFoundation
class VideoTableViewCell: UITableViewCell {
  let titleLabel = UILabel()
  let previewImageView = UIImageView()
  let subtitleLabel = UILabel()

  var video: Video? = nil {
    didSet {
      updateViews()
    }
  }
  
  // Sizing
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(false, animated: false)
  }
  
  // MARK - Table Cell Height
  
  class func height(for viewModel: Video) -> CGFloat {
    let previewHeight: CGFloat = 200
    let padding: CGFloat = 16

    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 24.0)
    label.text = viewModel.title
    let titleHeight = label.sizeThatFits(CGSize(width: UIScreen.main.bounds.width - 32, height: .infinity)).height
    
    label.text = viewModel.subtitle
    label.font = UIFont.systemFont(ofSize: 14.0)
    let subtitleHeight = label.sizeThatFits(CGSize(width: UIScreen.main.bounds.width - 32, height: .infinity)).height
    
    return padding + titleHeight + padding + previewHeight + padding + subtitleHeight + padding
  }
  
  // MARK - Obligatory Inits
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    addSubviews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    backgroundColor = .blue
  }
}
extension VideoTableViewCell {
 func createThumbnailOfVideoFromRemoteUrl(url: String) -> UIImage? {
     let asset = AVAsset(url: URL(string: url)!)
     let assetImgGenerate = AVAssetImageGenerator(asset: asset)
     assetImgGenerate.appliesPreferredTrackTransform = true
    let time = CMTimeMakeWithSeconds(1.0, preferredTimescale: 600)
     do {
         let img = try assetImgGenerate.copyCGImage(at: time, actualTime: nil)
         let thumbnail = UIImage(cgImage: img)
         return thumbnail
     } catch {
       print(error.localizedDescription)
       return nil
     }
 }
  func addSubviews() {
    previewImageView.contentMode = .scaleAspectFill
    previewImageView.clipsToBounds = true
    previewImageView.layer.cornerRadius = 4.0
    
    addSubview(titleLabel)
    addSubview(previewImageView)
    addSubview(subtitleLabel)
  }
  
  func updateViews() {
    print(video!.thumbURL)
    titleLabel.text = video?.title
    titleLabel.font = UIFont.systemFont(ofSize: 24.0)
    
      
    if let thumbnailImage = createThumbnailOfVideoFromRemoteUrl(url: video!.thumbURL) {
          previewImageView.image = thumbnailImage
      }
    
    
    subtitleLabel.text = video?.subtitle
    subtitleLabel.font = UIFont.systemFont(ofSize: 14.0)
    subtitleLabel.numberOfLines = 0
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    let previewHeight: CGFloat = 200
    let padding: CGFloat = 16
    
    let widthWithPadding = bounds.width - (2*padding)
    
    // Size
    let titleSize = titleLabel.sizeThatFits(CGSize(width: widthWithPadding, height: .infinity))
    titleLabel.bounds = CGRect(x: 0, y: 0, width: titleSize.width, height: titleSize.height)
    
    let subtitleSize = subtitleLabel.sizeThatFits(CGSize(width: widthWithPadding, height: .infinity))
    subtitleLabel.bounds = CGRect(x: 0, y: 0, width: subtitleSize.width, height: subtitleSize.height)
    
    previewImageView.bounds = CGRect(x: 0, y: 0, width: widthWithPadding, height: previewHeight)
    
    // Center
    titleLabel.center = CGPoint(x: titleLabel.bounds.width/2.0 + padding, y: padding + titleLabel.bounds.height/2.0)
    
    let imageYCenter = titleLabel.frame.origin.y + titleSize.height + padding + previewHeight/2.0
    previewImageView.center = CGPoint(x: bounds.width/2.0, y: imageYCenter)
    
    let subtitleYCenter = previewImageView.frame.origin.y + previewImageView.bounds.height + padding
    subtitleLabel.center = CGPoint(x: subtitleLabel.bounds.width/2.0 + padding, y: subtitleYCenter)
  }
}

extension VideoLooperView {
  override func layoutSubviews() {
    super.layoutSubviews()
    
    videoPlayerView.frame = bounds
    addSubview(videoPlayerView)
  }
}
