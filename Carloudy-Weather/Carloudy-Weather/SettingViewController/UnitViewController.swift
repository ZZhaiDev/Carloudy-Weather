//
//  UnitViewController.swift
//  Carloudy-Weather
//
//  Created by Zijia Zhai on 12/17/18.
//  Copyright © 2018 cognitiveAI. All rights reserved.
//

import UIKit

class UnitViewController: UIViewController {
    
    var mainViewController: MainViewController?
    var temperatureBool: Bool?
    
    let textLabel: UILabel = {
       let tl = UILabel(frame: CGRect(x: 15, y: 100, width: zjScreenWidth - 30, height: 50))
        tl.text = "Temperature Unit:"
        tl.font = UIFont.boldSystemFont(ofSize: 20)
        tl.textColor = .black
        return tl
    }()
    
    lazy var segmentedControl: UISegmentedControl = {
        let items = ["Fahrenheit", "Celsius"]
        let customSC = UISegmentedControl(items: items)
        if temperatureUnitIsCelsius == true{
            customSC.selectedSegmentIndex = 1
        }else{
            customSC.selectedSegmentIndex = 0
        }
        
        customSC.frame = CGRect(x: 20, y: 150, width: zjScreenWidth - 40 , height: 50)
        customSC.layer.cornerRadius = 5.0  // Don't let background bleed
        customSC.backgroundColor = UIColor.background
        customSC.tintColor = UIColor.blue
        customSC.alpha = 0.7
        customSC.addTarget(self, action: #selector(segClicked), for: .valueChanged)
        return customSC
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        temperatureBool = temperatureUnitIsCelsius
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if temperatureBool != temperatureUnitIsCelsius && currentCity_ != nil{
            mainViewController?.loadData(currentCity: currentCity_!)
        }
    }
}


// MARK:- setupUI
extension UnitViewController{
    fileprivate func setupUI(){
        navigationItem.title = "Unit"
        view.backgroundColor = UIColor.background
        
        self.view.addSubview(textLabel)
        self.view.addSubview(segmentedControl)
    }
    
    // MARK:- 这里需要reload data
    @objc func segClicked(sender: UISegmentedControl){
        switch sender.selectedSegmentIndex {
    
        case 0:
            temperatureUnitIsCelsius = false
            
        case 1:
            temperatureUnitIsCelsius = true
        default: break
        }
    }
    
}
