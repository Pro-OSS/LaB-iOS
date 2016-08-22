//
//  RegionCode2Name.swift
//  LaB-iOS
//
//  Created by 鲁浩 on 16/8/22.
//  Copyright © 2016年 鲁浩. All rights reserved.
//

import Foundation

class RegionCode2Name {
    
    var regionCode: String
    
    init(code: String) {
        self.regionCode = code
    }
    
    func toName() -> String {
        return regionCode
    }
    
    private func getNameOfTopLayer() {
        
    }
    
    private func getNameOfMiddleLayer() {
        
    }
    
    private func getNameOfBottomLayer() {
        
    }
    
}