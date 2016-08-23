//
//  User.swift
//  LaB-iOS
//
//  Created by 鲁浩 on 16/8/23.
//  Copyright © 2016年 鲁浩. All rights reserved.
//

import Foundation
import ObjectMapper

class User: Mappable {

	var id: Int!
	var nickname: String!
	var avatar: String?
	var borrowCount: Int!
	var lendCount: Int!
	var violationCount: Int!
	var createAt: NSDate!
	var updateAt: NSDate!

	required init?(_ map: Map) { }

	// Mappable
	func mapping(map: Map) {
		id <- map["id"]
        nickname <- map["nickname"]
        avatar <- map["avatar"]
		borrowCount <- map["borrowCount"]
        lendCount <- map["lendCount"]
        violationCount <- map["violationCount"]
		createAt <- (map["createAt"], DateTransform())
		updateAt <- (map["updateAt"], DateTransform())
	}

}