//
//  Photo.swift
//  LaB-iOS
//
//  Created by 鲁浩 on 16/8/22.
//  Copyright © 2016年 鲁浩. All rights reserved.
//

import Foundation
import ObjectMapper

class Photo : Mappable {

	var id: Int!
	var url: Int!
	var createAt: Date!

	required init?(_ map: Map) { }

	// Mappable
	func mapping(_ map: Map) {
		id <- map["id"]
		url <- map["url"]
		createAt <- (map["createAt"], DateTransform())
	}

}
