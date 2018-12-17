//
//  MainTableViewModel.swift
//  Carloudy-Weather
//
//  Created by zijia on 12/15/18.
//  Copyright © 2018 cognitiveAI. All rights reserved.
//

import  UIKit
class MainTableViewModel{
    lazy var mainTableViewModelForecastday: [Forecastday] = [Forecastday]()
}

extension MainTableViewModel{
    
    
    func loadAPIUXWeather(city: String, finishesCallBack: @escaping () -> ()){
        let urlStr = "http://api.apixu.com/v1/forecast.json?key=eed98b017a724a859a614908181712&q=\(city)&days=7"
        NetworkTools.requestData(.get, URLString: urlStr) { (result) in
            guard let dict = result as? [String: Any] else { return }
            guard let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: []) else{
                return
            }
            do {
                let data = try JSONDecoder().decode(TableModel.self, from: jsonData)
                guard let forecast = data.forecast else { return }
                guard let forecastday = forecast.forecastday else { return }
                for forecastEachDay in forecastday{
                    self.mainTableViewModelForecastday.append(forecastEachDay)
                }
            } catch let jsonError {
                print(jsonError)
            }
            
            finishesCallBack()
        }
    }
}
