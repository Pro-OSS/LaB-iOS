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
        last.contentMode = .scaleAspectFill
        last.snp.makeConstraints {
            (make) -> Void in
            make.left.equalTo(photosView.snp.left)
            make.centerY.equalTo(photosView.snp.centerY)
            make.height.equalTo(photosView.snp.height)
            make.width.equalTo(photosView.snp.height)
        }
        last.kf_setImage(with: URL(string: photos[0]), placeholder: UIImage(named: "avatar"))
        for p in photos.dropFirst() {
            let photo = UIImageView()
            photosView.addSubview(photo)
            photo.contentMode = .scaleAspectFill
            photo.snp.makeConstraints {
                make in
                make.left.equalTo(last.snp.right)
                make.centerY.equalTo(photosView.snp.centerY)
                make.height.equalTo(photosView.snp.height)
                make.width.equalTo(photosView.snp.height)
            }
            photo.kf_setImage(with: URL(string: p), placeholder: UIImage(named: "avatar"))
            last = photo
        }
        let width = CGFloat(Float(photos.count + 1) * Float(self.photosView.frame.height))
        self.photosView.contentSize = CGSize(width: width, height: self.photosView.frame.height)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
