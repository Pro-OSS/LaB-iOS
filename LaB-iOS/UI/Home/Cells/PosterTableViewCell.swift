//
//  Poster.swift
//  LaB-iOS
//
//  Created by 鲁浩 on 16/8/22.
//  Copyright © 2016年 鲁浩. All rights reserved.
//

import UIKit
import Kingfisher
import MapKit
import SnapKit

class PosterTableViewCell: UITableViewCell {

    @IBOutlet weak var userAvatar: UIImageView!
    @IBOutlet weak var userNickname: UILabel!
    @IBOutlet weak var createAt: UILabel!
    @IBOutlet weak var posterType: UILabel!
    @IBOutlet weak var unitPrice: UILabel!
    @IBOutlet weak var periodMode: UILabel!
    @IBOutlet weak var region: UILabel!
    @IBOutlet weak var summary: UITextView!
    @IBOutlet weak var communityName: UIButton!
    @IBOutlet weak var collectCount: UILabel!
    @IBOutlet weak var reviewCount: UILabel!
    @IBOutlet weak var photosView: UIScrollView!
    
    let photos: [String] = ["http://ww4.sinaimg.cn/mw690/592c38a3jw1f7n9c2rv4fj21w02iokjl.jpg", "http://ww4.sinaimg.cn/mw690/592c38a3jw1f7n9c2rv4fj21w02iokjl.jpg", "http://ww4.sinaimg.cn/mw690/592c38a3jw1f7n9c2rv4fj21w02iokjl.jpg", "http://ww4.sinaimg.cn/mw690/592c38a3jw1f7n9c2rv4fj21w02iokjl.jpg", "http://ww4.sinaimg.cn/mw690/592c38a3jw1f7n9c2rv4fj21w02iokjl.jpg", "http://ww4.sinaimg.cn/mw690/592c38a3jw1f7n9c2rv4fj21w02iokjl.jpg", "http://ww4.sinaimg.cn/mw690/592c38a3jw1f7n9c2rv4fj21w02iokjl.jpg", "http://ww4.sinaimg.cn/mw690/592c38a3jw1f7n9c2rv4fj21w02iokjl.jpg", "http://ww4.sinaimg.cn/mw690/592c38a3jw1f7n9c2rv4fj21w02iokjl.jpg", "http://ww4.sinaimg.cn/mw690/592c38a3jw1f7n9c2rv4fj21w02iokjl.jpg"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.photosView.alwaysBounceHorizontal = true
        var last = UIImageView()
        photosView.addSubview(last)
        last.contentMode = .ScaleAspectFill
        last.snp_makeConstraints {
            make in
            make.left.equalTo(photosView.snp_left)
            make.centerY.equalTo(photosView.snp_centerY)
            make.height.equalTo(photosView.snp_height)
            make.width.equalTo(photosView.snp_height)
        }
        last.kf_setImageWithURL(NSURL(string: photos[0]), placeholderImage: UIImage(named: "avatar"))
        for p in photos.dropFirst() {
            let photo = UIImageView()
            photosView.addSubview(photo)
            photo.contentMode = .ScaleAspectFill
            photo.snp_makeConstraints {
                make in
                make.left.equalTo(last.snp_right)
                make.centerY.equalTo(photosView.snp_centerY)
                make.height.equalTo(photosView.snp_height)
                make.width.equalTo(photosView.snp_height)
            }
            photo.kf_setImageWithURL(NSURL(string: p), placeholderImage: UIImage(named: "avatar"))
            last = photo
        }
        let width = CGFloat(Float(photos.count + 1) * Float(self.photosView.frame.height))
        self.photosView.contentSize = CGSizeMake(width, self.photosView.frame.height)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
