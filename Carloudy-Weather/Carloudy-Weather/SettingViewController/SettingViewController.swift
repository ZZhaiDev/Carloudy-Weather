//
//  SettingViewController.swift
//  Carloudy-Weather
//
//  Created by Zijia Zhai on 12/13/18.
//  Copyright © 2018 cognitiveAI. All rights reserved.
//

import UIKit


class SettingViewController: UIViewController {
    
    var mainViewController: MainViewController?
    private lazy var myArray: Array = {
        return [[["icon":"mine_feedBack", "title": "C/F"],
                 ["icon":"mine_setting", "title": "Carloudy Setting"]],
                
                [["icon":"mine_feedBack", "title": "帮助中心"],
                 ["icon":"mine_mail", "title": "我要反馈"],
                 ["icon":"mine_judge", "title": "给我们评分"]]]
    }()
    
    private lazy var head: MineHead = {
        return MineHead(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200))
    }()
    
    let cellId = "cellId"
    lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.backgroundColor = UIColor.background
        tv.delegate = self
        tv.dataSource = self
        tv.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        view.backgroundColor = .white
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.navigationController?.hidesBarsOnSwipe = true;
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        self.navigationController?.hidesBarsOnSwipe = false;
//    }
}



extension SettingViewController{
    
    
    
    fileprivate func setupUI(){
        
        view.addSubview(tableView)
        navigationItem.title = "Setting"
//        var navigationBarY: CGFloat = 88
//        if #available(iOS 11.0, *) {
//            navigationBarY = self.view.safeAreaInsets.top
//        } else {
//            navigationBarY = self.topLayoutGuide.length
//        }
//        var navigationBarY: CGFloat = 30
        let navigationBarY = navigationController?.navigationBar.frame.maxY ?? 88
//        let navigationBarY: CGFloat = 88
        tableView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: navigationBarY, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        tableView.parallaxHeader.view = head
        tableView.parallaxHeader.height = 200
        tableView.parallaxHeader.minimumHeight = 0
        tableView.parallaxHeader.mode = .topFill
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Exit", style: .plain, target: self, action: #selector(goback))
    }
    @objc fileprivate func goback(){
        self.dismiss(animated: true, completion: nil)
    }
}


extension SettingViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return myArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionArray = myArray[section]
        return sectionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        let sectionArray = myArray[indexPath.section]
        let dict: [String: String] = sectionArray[indexPath.row]
        cell.imageView?.image = UIImage(named: dict["icon"] ?? "")
        cell.textLabel?.text = dict["title"]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       ZJPrint(indexPath.item)
        ZJPrint(indexPath.row)
        if indexPath == [0, 0]{
            let unitVC = UnitViewController()
            unitVC.mainViewController = mainViewController
            navigationController?.pushViewController(unitVC, animated: true)
        }else if indexPath == [0, 1]{
            let csVC = CarloudySettingViewController()
            navigationController?.pushViewController(csVC, animated: true)
        }
    }
    
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let scrollOffset = scrollView.contentOffset.y;
////        ZJPrint(scrollOffset)
//        if (scrollOffset < -244)
//        {
//            self.navigationController?.hidesBarsOnSwipe = false;
//            self.navigationController?.setNavigationBarHidden(false, animated: true)
//        }
//        else
//        {
//            self.navigationController?.hidesBarsOnSwipe = true;
//
//        }
//    }
//
//
//    //always called after the user lifts their finger
//    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        self.navigationController?.hidesBarsOnSwipe = false;
//        self.navigationController?.setNavigationBarHidden(false, animated: true)
//    }
//
//    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
//
//    }
    
    
    
}

