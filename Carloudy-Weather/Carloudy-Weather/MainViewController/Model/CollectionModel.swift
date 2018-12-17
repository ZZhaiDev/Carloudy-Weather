//
//  CollectionModel.swift
//  Carloudy-Weather
//
//  Created by zijia on 12/15/18.
//  Copyright © 2018 cognitiveAI. All rights reserved.
//

import UIKit

//http://api.openweathermap.org/data/2.5/forecast?q=Chicago,US&appid=76d9dff8a633f10f3c5944948d84bd8b

struct CollectionModel: Decodable {
    //number of item
    var cnt: Int?
    var list: [List]?
    var city: City?
}

struct List: Decodable {
    // since1970
    var dt: Int?
    var main: Main?
    var weather: [Weather]?
    var wind: Wind?
    //"2018-12-16 21:00:00"
    var dt_text: String?
}

struct Main: Decodable {
    var temp: CGFloat?
    var temp_min: CGFloat?
    var temp_max: CGFloat?
    var pressure: CGFloat?
}

struct Weather: Decodable {
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
}

struct Wind: Decodable {
    var speed: CGFloat?
    var deg: CGFloat?
}

struct City: Decodable {
    var id: Int?
    var name: String?
    var coord: Coord?
    var country: String?
    var population: Int?
}

struct Coord: Decodable{
    var lat: CGFloat?
    var lon: CGFloat?
}

//class CollectionModel: NSObject {
//
//
//
//    //number of item
//    var cnt: Int = 0
//    // since1970
//    var dt: String?
//    //"2018-12-16 03:00:00"
//    var dt_txt: String?
//    var temp: CGFloat?
//    var temp_min: CGFloat?
//    var temp_max: CGFloat?
//    var pressure: CGFloat?
//    var humidity: CGFloat?
//    var main: String?
//    var icon: String?
//    var speed: String?
//
//
//
//    init(dict: [String: Any]) {
//
//    }
//
//    override func setValue(_ value: Any?, forUndefinedKey key: String) {
//    }
//}
