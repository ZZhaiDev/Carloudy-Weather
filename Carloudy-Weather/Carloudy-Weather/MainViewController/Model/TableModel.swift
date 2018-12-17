//
//  TableModel.swift
//  Carloudy-Weather
//
//  Created by zijia on 12/15/18.
//  Copyright © 2018 cognitiveAI. All rights reserved.
//

import UIKit


struct TableModel: Decodable {
    var location: Location?
    var current: Current?
    var forecast: Forecast?
}

struct Location: Decodable {
    var name: String?           //"name": "Chicago"
    var region: String?         //region": "Illinois"
    var country: String?        //United States of America
    var lat: Double?
    var lon: Double?
    var localtime_epoch: Int?   //1545012759
    var localtime: String?      //"2018-12-16 20:12"
    var forecast: Forecast?
}

struct Current: Decodable {
    var last_updated_epoch: Int?    //1545012009
    var last_updated: String?       //2018-12-16 20:00
    var temp_c: CGFloat?        //4.4
    var temp_f: CGFloat               //39.9
    var is_day: Int?            //0
    var condition: Condition?
    var wind_mph: CGFloat?  // 6.9,
    var wind_kph: CGFloat?  // 11.2,
    var wind_degree: Int? //270,
    var wind_dir: String?   // "W",
    var pressure_mb: Int? //1019,
    var pressure_in: CGFloat?   //30.6,
//    var precip_mm: Int? //0,
//    var precip_in: Int? //0,
    var humidity: Int? //76,
    var cloud: Int? //25,
    var feelslike_c: CGFloat? //1.7,
    var feelslike_f: CGFloat? //35.1,
    var vis_km: Int? //16,
    var vis_miles: Int? //9,
    var uv: Int? //2
}

struct Condition: Decodable {
    var text: String?       //partly cloudy
    var icon: String?       //http://api.apixu.com/v1///cdn.apixu.com/weather/64x64/night/116.png
    var code: Int?          //1003
}

struct Forecast: Decodable {
    var forecastday: [Forecastday]?
}

struct Forecastday: Decodable {
    var date: String?      //2018-12-16
    var date_epoch: Double?         //1544918400
    var day: Day?
    var astro: Astro?
}

struct Day: Decodable {
    var maxtemp_c: CGFloat?     //6.2
    var maxtemp_f: CGFloat?     //6.2
    var mintemp_c: CGFloat?     //6.2
    var mintemp_f: CGFloat?     //6.2
    var avgtemp_c: CGFloat?     //6.2
    var avgtemp_f: CGFloat?     //6.2
    var maxwind_mph: CGFloat?
    var maxwind_kph: CGFloat?
    var avghumidity: Int?
    var condition: Condition?
    var uv: CGFloat?
}

struct Astro: Decodable {
    var sunrise: String?            //07:12 AM
    var sunset: String?             //04:12 pM
    var moonrise: String?           //"12:55 PM"
    var moonset: String?            //12:17 AM
}
