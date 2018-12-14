//
//  ViewController.swift
//  Carloudy-Weather
//
//  Created by Zijia Zhai on 12/13/18.
//  Copyright © 2018 cognitiveAI. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupNavigationBarItem()
    }
}


// MARK:- UISetup
extension MainViewController{
    fileprivate func setupNavigationBarItem(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "search_unselected"), style: .plain, target: self, action: #selector(searchBarButtonItemClicked))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "gear"), style: .plain, target: self, action: #selector(settingBarButtonItemClicked))
    }
    
    @objc fileprivate func searchBarButtonItemClicked(){
        navigationController?.pushViewController(SearchViewController(), animated: true)
    }
    @objc fileprivate func settingBarButtonItemClicked(){
//        navigationController?.pushViewController(SettingViewController(), animated: true)
        let setVC = SettingViewController()
        let nvc = UINavigationController(rootViewController: setVC)
        self.present(nvc, animated: true, completion: nil)
    }
}

