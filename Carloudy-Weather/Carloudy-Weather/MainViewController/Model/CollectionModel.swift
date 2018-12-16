//
//  CollectionModel.swift
//  Carloudy-Weather
//
//  Created by zijia on 12/15/18.
//  Copyright © 2018 cognitiveAI. All rights reserved.
//

import UIKit

class CollectionModel: NSObject {
    
    //number of item
    var cnt: Int = 0
    // since1970
    var dt: String?
    //"2018-12-16 03:00:00"
    var dt_txt: String?
    var temp: CGFloat?
    var temp_min: CGFloat?
    var temp_max: CGFloat?
    var pressure: CGFloat?
    var humidity: CGFloat?
    var main: String?
    var icon: String?
    var speed: String?
    
    
    
    init(dict: [String: Any]) {
        
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }
}
