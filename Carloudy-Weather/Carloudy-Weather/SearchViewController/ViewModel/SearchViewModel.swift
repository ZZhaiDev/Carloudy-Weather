//
//  SearchViewModel.swift
//  Carloudy-Weather
//
//  Created by Zijia Zhai on 12/13/18.
//  Copyright © 2018 cognitiveAI. All rights reserved.
//

import UIKit

class SearchViewModel {
    lazy var searchModels: [SearchModel] = [SearchModel]()
}

extension SearchViewModel{
    func loadCitiesData(str: String, finishesCallBack: @escaping () -> ()){
        let urlStr = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=\(str)&types=(cities)&language=EN&country=us&key=AIzaSyB-v-ac0d_I5do478BBROehAvLbltTpsGw"
        NetworkTools.requestData(.get, URLString: urlStr, parameters: nil) { (result) in
            guard let resultDict = result as? [String: Any] else { return }
            guard let predictions = resultDict["predictions"] as? [[String: Any]] else { return }
            for prediction in predictions{
                self.searchModels.append(SearchModel(dict: prediction))
            }
            finishesCallBack()
        }
        
        
    }
}
