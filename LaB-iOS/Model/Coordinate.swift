//
//  Coordinate.swift
//  LaB-iOS
//
//  Created by 鲁浩 on 16/8/22.
//  Copyright © 2016年 鲁浩. All rights reserved.
//

import Foundation
import ObjectMapper

struct Coordinate : Mappable {

    var latitude:  Double!
    var longitude: Double!

	init?(_ map: Map) {

	}

	mutating func mapping(_ map: Map) {
        latitude  <- map["latitude"]
        longitude <- map["longitude"]
	}

}
