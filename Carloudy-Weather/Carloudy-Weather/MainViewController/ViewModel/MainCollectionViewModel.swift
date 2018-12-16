//
//  MainCollectionViewModel.swift
//  Carloudy-Weather
//
//  Created by zijia on 12/15/18.
//  Copyright © 2018 cognitiveAI. All rights reserved.
//

import UIKit

class MainCollectionViewModel {
    lazy var mainCollectionViewModel: [CollectionModel] = [CollectionModel]()
}

extension MainCollectionViewModel{
    func loadWeatherData(str: String, finishesCallBack: @escaping () -> ()){
        let url = "http://api.openweathermap.org/data/2.5/forecast?q=\(str),US&appid=76d9dff8a633f10f3c5944948d84bd8b"
        NetworkTools.requestData(.get, URLString: url) { (result) in
            print(result)
        }
        
    }
}
