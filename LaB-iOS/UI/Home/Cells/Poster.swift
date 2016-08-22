//
//  Poster.swift
//  LaB-iOS
//
//  Created by 鲁浩 on 16/8/22.
//  Copyright © 2016年 鲁浩. All rights reserved.
//

import UIKit

class Poster: UITableViewCell {

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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
