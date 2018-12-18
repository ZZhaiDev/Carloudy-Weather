//
//  Commons_variable.swift
//  Carloudy-Weather
//
//  Created by Zijia Zhai on 12/17/18.
//  Copyright © 2018 cognitiveAI. All rights reserved.
//

import UIKit


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
