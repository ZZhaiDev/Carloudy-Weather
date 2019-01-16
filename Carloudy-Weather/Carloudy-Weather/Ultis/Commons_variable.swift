//
//  Commons_variable.swift
//  Carloudy-Weather
//
//  Created by Zijia Zhai on 12/17/18.
//  Copyright © 2018 cognitiveAI. All rights reserved.
//

import UIKit

//Commons
let zjScreenWidth: CGFloat = UIScreen.main.bounds.width
let zjScreenHeight: CGFloat = UIScreen.main.bounds.height
let zjSeachFirstViewCellHeight: CGFloat = 160


// 判断是否为 iPhone X
let isIphoneX = zjScreenHeight >= 812 ? true : false
// 状态栏高度
let zjStatusHeight : CGFloat = isIphoneX ? 44 : 20
// 导航栏高度
let zjNavigationBarHeight :CGFloat = 44
// TabBar高度
let zjTabBarHeight : CGFloat = isIphoneX ? 49 + 34 : 49


var currentCity_: String?
var carloudyBlePairKey_: String?
var carloudyAppStoreAppKey_: String = "86kbwkvk"
var launchAppByCarloudyNotificationKey_ = "launchAppByCarloudyNotificationKey"

var temperatureUnitIsCelsius = false {
    didSet{
        let defaults = UserDefaults.standard
        defaults.set(temperatureUnitIsCelsius, forKey: "temperatureUnitIsCelsius")
    }
}

class CatchWeatherData: NSObject, Codable {
    var timeStamp: Double?
    var tableViewData: TableModel?
    var collectionData: CollectionModel?
}
//var catchWeatherData: [String: Any]?

//let fileUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
//    .appendingPathComponent("weatherData.json")

func getTemperatureStr(Imperial: CGFloat) -> String{
    if temperatureUnitIsCelsius == true{
        return String(Int(Imperial - 273.15 + 0.5)) + "°"
    }else{
        let c = Imperial - 273.15
        return String(Int(c*9/5+32.5)) + "°"
    }
}
