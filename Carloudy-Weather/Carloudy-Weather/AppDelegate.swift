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
        
        ZJPrint(NSHomeDirectory())
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
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        ZJPrint(url)        //com.CognitiveAI.CarloudyWeather://9145221111111111
        if let pairKey = url.absoluteString.components(separatedBy: "://").last{
            carloudyBlePairKey_ = pairKey
            
        }
        return true
    }
}


//extension AppDelegate: MainContentViewHeaderDelegate {
//    func mainContentViewHeader(temperature: String, weather: String) {
//    }
//
//}

