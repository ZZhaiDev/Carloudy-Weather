//
//  SearchModel.swift
//  Carloudy-Weather
//
//  Created by Zijia Zhai on 12/13/18.
//  Copyright © 2018 cognitiveAI. All rights reserved.
//

import UIKit

//https://maps.googleapis.com/maps/api/place/autocomplete/json?input=Vict&types=(cities)&language=EN&key=AIzaSyB-v-ac0d_I5do478BBROehAvLbltTpsGw

class SearchModel: NSObject {
    var location: String = ""
    
    override init() {
    }
    
    init(dict: [String: Any]) {
        location = dict["description"] as! String
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }
}
