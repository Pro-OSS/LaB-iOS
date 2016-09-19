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
    
    fileprivate let dict = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "Region", ofType: "plist")!) as! Dictionary<String, String>
    
    init(code: String) {
        self.regionCode = code
    }
    
    func toName() -> String {
        let topLayerName = self.getNameOfTopLayer()
        let middleLayerName = self.getNameOfMiddleLayer()
        let bottomLayerName = self.getNameOfBottomLayer()
        return handleLongName(topLayerName, middleLayerName: middleLayerName, bottomLayerName: bottomLayerName)
    }
    
    fileprivate func handleLongName(_ topLayerName: String, middleLayerName: String, bottomLayerName: String) -> String {
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
    
    fileprivate func getNameOfTopLayer() -> String {
        let layerCode = regionCode.substring(with: self.regionCode.startIndex..<self.regionCode.characters.index(self.regionCode.endIndex, offsetBy: -3)) + "000"
        guard let result =  dict[layerCode] else {
            return ""
        }
        return result
    }
    
    fileprivate func getNameOfMiddleLayer() -> String {
        let layerCode = regionCode.substring(with: self.regionCode.startIndex..<self.regionCode.characters.index(self.regionCode.endIndex, offsetBy: -2)) + "00"
        guard let result = dict[layerCode] else {
            return ""
        }
        if (result == "县" || result == "市辖区") {
            return ""
        }
        return "·" + result
    }
    
    fileprivate func getNameOfBottomLayer() -> String {
        let layerCode = regionCode.substring(with: self.regionCode.startIndex..<self.regionCode.characters.index(self.regionCode.endIndex, offsetBy: -2)) + "00"
        guard let result = dict[layerCode] else {
            return ""
        }
        return "·" + result
    }
    
}
