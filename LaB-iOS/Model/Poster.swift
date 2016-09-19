//
//  Poster.swift
//  LaB-iOS
//
//  Created by 鲁浩 on 16/8/22.
//  Copyright © 2016年 鲁浩. All rights reserved.
//

import Foundation
import ObjectMapper

class Poster : Mappable {

    var id:         Int!
    var title:      String!
    var thumbnail:  String?
    var coordinate: Coordinate!
    var createAt:   Date!
    var updateAt:   Date!
    var creator:    User!

	required init?(_ map: Map) { }

	// Mappable
	func mapping(_ map: Map) {
        id         <- map["id"]
        title      <- map["title"]
        thumbnail  <- map["thumbnail"]
        coordinate <- map["coordinate"]
        createAt   <- (map["createAt"], DateTransform())
        updateAt   <- (map["updateAt"], DateTransform())
        creator    <- map["creator"]
	}

}
