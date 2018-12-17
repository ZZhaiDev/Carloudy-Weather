//
//  AppDelegate.swift
//  Carloudy-Weather
//
//  Created by Zijia Zhai on 12/13/18.
//  Copyright © 2018 cognitiveAI. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        delegateSetUp()
        
        UINavigationBar.appearance().tintColor = UIColor.orange
        window = UIWindow()
        window?.rootViewController = UINavigationController(rootViewController: MainViewController())
        window?.makeKeyAndVisible()
        return true
    }
    
    func delegateSetUp(){
        let defaults = UserDefaults.standard
        temperatureUnitIsCelsius = defaults.bool(forKey: "temperatureUnitIsCelsius")
        print(temperatureUnitIsCelsius)
    }


}

