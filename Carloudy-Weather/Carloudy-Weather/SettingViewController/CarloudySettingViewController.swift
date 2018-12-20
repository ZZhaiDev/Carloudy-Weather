//
//  CarloudySettingViewController.swift
//  CarloudyWeather
//
//  Created by Zijia Zhai on 12/19/18.
//  Copyright © 2018 cognitiveAI. All rights reserved.
//

import UIKit
import CarloudyiOS

class CarloudySettingViewController: UIViewController {
    
    let textLabel: UILabel = {
        let tl = UILabel()
        tl.numberOfLines = 0
        tl.text = "1. Pair your Carloudy App and Carloudy HUD\n\n2. Open Carloudy-Weather app by Carloudy App\n\nStep1 & Step2 will give Carloudy-Weather app the pair key, you only need to do them once if you do not change the pair key\n\n\n\n3. Then you can update app images for Carloudy now:"
        tl.font = UIFont.boldSystemFont(ofSize: 15)
        tl.textColor = .black
        return tl
    }()
    
    lazy var updateButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        button.alpha = 0.5
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Update", for: .normal)
        button.addTarget(self, action: #selector(updateButtonClicked), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    
    fileprivate func setupUI(){
        self.view.backgroundColor = UIColor.background
        self.view.addSubview(textLabel)
        textLabel.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 100, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: zjScreenWidth - 40, height: 0)
        self.view.addSubview(updateButton)
        updateButton.anchor(top: textLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: zjScreenWidth - 40, height: 50)
    }
    
    @objc func updateButtonClicked(){
        
        let carloudyBLE = CarloudyBLE.shareInstance
        if let pairkey = carloudyBlePairKey_{
            carloudyBLE.newKeySendToPairAndorid_ = pairkey
        }
        
        carloudyBLE.startANewSession(appId: carloudyAppStoreAppKey_)
        carloudyBLE.alertViewToUpdateImagesFromServer()
        ZJPrint(carloudyBLE)
    }

   

}
