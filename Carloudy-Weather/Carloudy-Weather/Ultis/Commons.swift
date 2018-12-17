//
//  Commons.swift
//  Carloudy-Weather
//
//  Created by Zijia Zhai on 12/13/18.
//  Copyright © 2018 cognitiveAI. All rights reserved.
//

import UIKit
//5 days weather
//http://api.openweathermap.org/data/2.5/forecast?q=dallas,US&appid=76d9dff8a633f10f3c5944948d84bd8b
//current weather
//http://api.openweathermap.org/data/2.5/weather?q=Chicago,US&appid=76d9dff8a633f10f3c5944948d84bd8b
//weather icon
//https://openweathermap.org/weather-conditions

//度数： optional + shift + 8
//1970 to now: https://www.epochconverter.com/

//Google
let googleSerivePrivateAPI = "AIzaSyB-v-ac0d_I5do478BBROehAvLbltTpsGw"

//open Weather API
let openWeatherURL = "http://api.openweathermap.org/data/2.5/weather?lat=41.889824&lon=-87.629045&APPID=76d9dff8a633f10f3c5944948d84bd8b"
let openWeatherAPI = "76d9dff8a633f10f3c5944948d84bd8b"

// APIXU -(一月最多10000calls) 天气 7天最多每天天气
//http://api.apixu.com/v1/forecast.json?key=eed98b017a724a859a614908181712&q=chicago&days=7
//api key: eed98b017a724a859a614908181712
let apiUX = "eed98b017a724a859a614908181712"

//Commons
let zjScreenWidth: CGFloat = UIScreen.main.bounds.width
let zjScreenHeight: CGFloat = UIScreen.main.bounds.height
let zjSeachFirstViewCellHeight: CGFloat = 160



/*
 apixu: 10,000 call per month
 
 So to get current weather for London: JSON: http://api.apixu.com/v1/current.json?key=<YOUR_API_KEY>&q=London
 
 XML: http://api.apixu.com/v1/current.xml?key=<YOUR_API_KEY>&q=London
 To get 7 day weather for US Zipcode 07112: JSON: http://api.apixu.com/v1/forecast.json?key=<YOUR_API_KEY>&q=07112&days=7
 
 XML: http://api.apixu.com/v1/forecast.xml?key=<YOUR_API_KEY>&q=07112&days=7
 Search for cities starting with Lond: JSON: http://api.apixu.com/v1/search.json?key=<YOUR_API_KEY>&q=lond
 XML: http://api.apixu.com/v1/search.xml?key=<YOUR_API_KEY>&q=lond
 
 */
