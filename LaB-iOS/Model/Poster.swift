//
//  Poster.swift
//  LaB-iOS
//
//  Created by 鲁浩 on 16/8/22.
//  Copyright © 2016年 鲁浩. All rights reserved.
//

import Foundation
import ObjectMapper

class Poster: Mappable {
    
    var id: Int?
    var title: String?
    var thumbnail: String!
    var array: [AnyObject]?
    var dictionary: [String : AnyObject] = [:]
    var coordinate: Coordinate?                       // Nested User object
    var friends: [User]?                        // Array of Users
    var birthday: NSDate?
    
    required init?(_ map: Map) {}
    
    // Mappable
    func mapping(map: Map) {
        username    <- map["username"]
        age         <- map["age"]
        weight      <- map["weight"]
        array       <- map["arr"]
        dictionary  <- map["dict"]
        coordinate  <- map["coordinate"]
        friends     <- map["friends"]
        birthday    <- (map["birthday"], DateTransform())
    }
    
}