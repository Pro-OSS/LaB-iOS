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
        let topLayerName = self.getNameOfTopLayer()
        let middleLayerName = self.getNameOfMiddleLayer()
        let bottomLayerName = self.getNameOfBottomLayer()
        let lengthOfName = (topLayerName + middleLayerName + bottomLayerName).characters.count
        if (lengthOfName > 15) {
            return bottomLayerName
        }
        if (lengthOfName > 9) {
            return middleLayerName + "·" + bottomLayerName
        }
        if (lengthOfName == 0) {
            return "未知"
        }
        return topLayerName + "·" + middleLayerName + "·" + bottomLayerName
    }
    
    private func getNameOfTopLayer() -> String {
        let layerCode = regionCode.substringWithRange(self.regionCode.startIndex..<self.regionCode.endIndex.advancedBy(-3)) + "000"
        guard let result = RegionCode[layerCode] else {
            return ""
        }
        return result
    }
    
    private func getNameOfMiddleLayer() -> String {
        let layerCode = regionCode.substringWithRange(self.regionCode.startIndex..<self.regionCode.endIndex.advancedBy(-2)) + "00"
        guard let result = RegionCode[layerCode] else {
            return ""
        }
        return result
    }
    
    private func getNameOfBottomLayer() -> String {
        let layerCode = regionCode.substringWithRange(self.regionCode.startIndex..<self.regionCode.endIndex.advancedBy(-2)) + "00"
        guard let result = RegionCode[layerCode] else {
            return ""
        }
        return result
    }
    
}