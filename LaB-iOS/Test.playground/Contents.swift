//: Playground - noun: a place where people can play

import Foundation

let time = NSDate.init(timeIntervalSinceReferenceDate: 1471761432443 / 1000)

let regionCode = "123456"
regionCode.substringWithRange(regionCode.startIndex..<regionCode.endIndex.advancedBy(-3)) + "000"