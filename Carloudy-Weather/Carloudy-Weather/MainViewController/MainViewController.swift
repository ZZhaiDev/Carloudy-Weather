//
//  ViewController.swift
//  Carloudy-Weather
//
//  Created by Zijia Zhai on 12/13/18.
//  Copyright © 2018 cognitiveAI. All rights reserved.
//

import UIKit

private let zjTitleViewH : CGFloat = 40
class MainViewController: UIViewController {
    private lazy var navigationMaxY: CGFloat = (navigationController?.navigationBar.frame.maxY) ?? 88
    let titles = ["Chicago"]
    
    
    fileprivate lazy var pageTitleView: PageTitleView = {
        let titleFrame = CGRect(x: 0, y: navigationMaxY, width: zjScreenWidth, height: zjTitleViewH)
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        return titleView
    }()
    
    fileprivate lazy var mainContentView: MainContentView = {
        let y = navigationMaxY + zjTitleViewH
        let w = zjScreenWidth * CGFloat(1)
        let h = zjScreenHeight - y
        let titleFrame = CGRect(x: 0, y: y, width: w, height: h)
        let mc = MainContentView(frame: titleFrame, titles: titles)
        return mc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setupUI()
    }
}


// MARK:- UISetup
extension MainViewController{
    fileprivate func setupUI(){
        view.addSubview(pageTitleView)
        view.addSubview(mainContentView)
       setupNavigationBarItem()
    }
    
    fileprivate func setupNavigationBarItem(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "search_unselected"), style: .plain, target: self, action: #selector(searchBarButtonItemClicked))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "gear"), style: .plain, target: self, action: #selector(settingBarButtonItemClicked))
    }
    
    @objc fileprivate func searchBarButtonItemClicked(){
        let setVC = SearchViewController()
        let nvc = UINavigationController(rootViewController: setVC)
        self.present(nvc, animated: true, completion: nil)
    }
    @objc fileprivate func settingBarButtonItemClicked(){
//        navigationController?.pushViewController(SettingViewController(), animated: true)
        let setVC = SettingViewController()
        let nvc = UINavigationController(rootViewController: setVC)
        self.present(nvc, animated: true, completion: nil)
    }
}

