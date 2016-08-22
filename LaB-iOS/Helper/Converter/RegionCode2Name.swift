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
    
    private let dict = NSDictionary(contentsOfFile: NSBundle.mainBundle().pathForResource("Region", ofType: "plist")!) as! Dictionary<String, String>
    
    init(code: String) {
        self.regionCode = code
    }
    
    func toName() -> String {
        let topLayerName = self.getNameOfTopLayer()
        let middleLayerName = self.getNameOfMiddleLayer()
        let bottomLayerName = self.getNameOfBottomLayer()
        return handleLongName(topLayerName, middleLayerName: middleLayerName, bottomLayerName: bottomLayerName)
    }
    
    private func handleLongName(topLayerName: String, middleLayerName: String, bottomLayerName: String) -> String {
        let name = topLayerName + middleLayerName + bottomLayerName
        let lengthOfName = name.characters.count
        if (lengthOfName > 15) {
            return bottomLayerName
        }
        if (lengthOfName > 9) {
            if (middleLayerName == "") {
                return topLayerName + bottomLayerName
            } else {
                return middleLayerName + bottomLayerName
            }
        }
        if (lengthOfName == 0) {
            return "未知"
        }
        return name
    }
    
    private func getNameOfTopLayer() -> String {
        let layerCode = regionCode.substringWithRange(self.regionCode.startIndex..<self.regionCode.endIndex.advancedBy(-3)) + "000"
        guard let result =  dict[layerCode] else {
            return ""
        }
        return result
    }
    
    private func getNameOfMiddleLayer() -> String {
        let layerCode = regionCode.substringWithRange(self.regionCode.startIndex..<self.regionCode.endIndex.advancedBy(-2)) + "00"
        guard let result = dict[layerCode] else {
            return ""
        }
        if (result == "县" || result == "市辖区") {
            return ""
        }
        return "·" + result
    }
    
    private func getNameOfBottomLayer() -> String {
        let layerCode = regionCode.substringWithRange(self.regionCode.startIndex..<self.regionCode.endIndex.advancedBy(-2)) + "00"
        guard let result = dict[layerCode] else {
            return ""
        }
        return "·" + result
    }
    
}