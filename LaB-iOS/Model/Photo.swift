//
//  Photo.swift
//  LaB-iOS
//
//  Created by 鲁浩 on 16/8/22.
//  Copyright © 2016年 鲁浩. All rights reserved.
//

import Foundation
import ObjectMapper

class Photo: Mappable {

	var id: Int?
	var url: Int?
	var createAt: Int!

	required init?(_ map: Map) { }

	// Mappable
	func mapping(map: Map) {
		id <- map["id"]
		url <- map["url"]
		createAt <- map["createAt"]
	}

}