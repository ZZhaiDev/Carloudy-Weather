//
//  MainCollectionViewModel.swift
//  Carloudy-Weather
//
//  Created by zijia on 12/15/18.
//  Copyright © 2018 cognitiveAI. All rights reserved.
//

import UIKit

class MainCollectionViewModel {
    lazy var mainCollectionViewModel: CollectionModel = CollectionModel()
    lazy var mainCollectionViewModelList: [List] = [List]()
//    lazy var mainCollectionViewModel: CollectionModel = CollectionModel()
}

extension MainCollectionViewModel{
    func loadWeatherData(str: String, finishesCallBack: @escaping () -> ()){
        var url = "http://api.openweathermap.org/data/2.5/forecast?q=\(str),US&appid=76d9dff8a633f10f3c5944948d84bd8b"
//        url = "http://api.openweathermap.org/data/2.5/forecast?q=chicago,US&appid=76d9dff8a633f10f3c5944948d84bd8b"
        NetworkTools.requestData(.get, URLString: url) { (result) in
            guard let dict = result as? [String: Any] else { return }
//            let dic = ["2": "B", "1": "A", "3": "C"]
//            let encoder = JSONEncoder()
//            if let jsonData = try? encoder.encode(dic) {
//                if let jsonString = String(data: jsonData, encoding: .utf8) {
//                    print(jsonString)
//                }
//            }
//            dict to data
            guard let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: []) else{
                return
            }
            do {
                let data = try JSONDecoder().decode(CollectionModel.self, from: jsonData)
                self.mainCollectionViewModel = data
                guard let list = data.list else {return}
                for l in list{
                    self.mainCollectionViewModelList.append(l)
                }
            } catch let jsonError {
                print(jsonError)
            }
            
            finishesCallBack()
        }
        
    }
}
