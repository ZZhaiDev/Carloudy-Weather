//
//  ViewController.swift
//  Carloudy-Weather
//
//  Created by Zijia Zhai on 12/13/18.
//  Copyright © 2018 cognitiveAI. All rights reserved.
//

import UIKit
import CarloudyiOS
import CoreLocation

private let zjTitleViewH : CGFloat = 40
class MainViewController: BaseViewController {
    
    var currentCity: String?
    fileprivate lazy var mainCollectionViewMode = MainCollectionViewModel()
    fileprivate lazy var mainTableViewModel = MainTableViewModel()
    fileprivate lazy var carloudyLocation = CarloudyLocation(sendSpeed: true, sendAddress: true)
    private lazy var navigationMaxY: CGFloat = (navigationController?.navigationBar.frame.maxY) ?? 88
    let titles = ["Chicago"]
    
    lazy var labelView: UILabel = {
       let label = UILabel()
        label.textColor = .black
//        var customFont = UIFont(name:"Baskerville-BoldItalic",size:UIFont.labelFontSize)
//        label.font = UIFontMetrics.default.scaledFont(for: customFont ?? UIFont())
//        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont(name:"PartyLetPlain",size:25)
//        SnellRoundhand, SnellRoundhand-Bold,SnellRoundhand-Black, PartyLetPlain, BradleyHandITCTT-Bold, ZapfDingbatsITC
        label.text = "Carloudy-Weather"
        return label
    }()
    
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
        
        carloudyLocation.delegate = self
        carloudyLocation.locationManager.requestAlwaysAuthorization()
        carloudyLocation.locationManager.startUpdatingLocation()
//        for family in UIFont.familyNames.sorted() {
//            let names = UIFont.fontNames(forFamilyName: family)
//            print("Family: \(family) Font names: \(names)")
//        }
//        carloudyLocation.locationManager.location
        setupUI()
    }
    
    override func setupUI() {
        
        contentView = mainContentView
        
        view.addSubview(pageTitleView)
        view.addSubview(mainContentView)
        navigationItem.titleView = labelView
//        view.backgroundColor = .white
        setupNavigationBarItem()
        
        
        
        super.setupUI()
//        loadDataFinished()
        
    }
    
  

}



// MARK:- API CALL
extension MainViewController{
    fileprivate func loadData(currentCity: String){
        
        let defaults = UserDefaults.standard
        let str = defaults.string(forKey: currentCity.lowercased())
        if let data = str?.data(using: .utf8){
            do {
                let json = try JSONDecoder().decode(CatchWeatherData.self, from: data)
                if let timestamp = json.timeStamp {
                    ZJPrint(timestamp)
                    
                }
                
            } catch let jsonError {
                ZJPrint(jsonError)
            }
            
        }
        
    
        
        var collectionData: CollectionModel?
        var tableViewData: TableModel?
        
        mainCollectionViewMode.loadWeatherData(str: currentCity) {
            collectionData = self.mainCollectionViewMode.mainCollectionViewModel
            self.saveData(collectionData: collectionData, tableViewData: tableViewData, currentCity: currentCity)
            // 传送数据 并刷新
            self.reloadCollectionData()
        }
        mainTableViewModel.loadAPIUXWeather(city: currentCity) {
            tableViewData = self.mainTableViewModel.mainContentViewHeaderMode_all
            self.saveData(collectionData: collectionData, tableViewData: tableViewData, currentCity: currentCity)
            self.reloadTableData()
        }
        loadDataFinished()
    }
    
    fileprivate func saveData(collectionData: CollectionModel?, tableViewData: TableModel?, currentCity: String){
        let timestamp = NSDate().timeIntervalSince1970
        if collectionData == nil || tableViewData == nil{ return }
        
        let dict = CatchWeatherData()
        dict.timeStamp = timestamp
        dict.collectionData = collectionData
        dict.tableViewData = tableViewData
        
        if let jsonData = try? JSONEncoder().encode(dict) {
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                    let defaults = UserDefaults.standard
                    defaults.set(jsonString, forKey: currentCity.lowercased())
            }
        }
        
////        var MainDict =  [String: Any]()
//        var dict = [String: Any]()
//        dict["timestamp"] = timestamp
//        dict["collectionData"] = collectionData
//        dict["tableViewData"] = tableViewData
////        MainDict[currentCity] = dict
//        let defaults = UserDefaults.standard
//        defaults.set(collectionData!, forKey: currentCity.lowercased())
////        let data = NSKeyedArchiver.archivedData(withRootObject: dict)
////        UserDefaults.standard.set(data, forKey: currentCity.lowercased())
        
        
        
    }
    
    fileprivate func reloadCollectionData(){
        self.mainContentView.collectionView.list = self.mainCollectionViewMode.mainCollectionViewModelList
        self.mainContentView.collectionView.collectionView.reloadData()
    }
    
    fileprivate func reloadTableData(){
       self.mainTableViewModel.mainTableViewModelForecastday.removeFirst()         //remove 当天数据
        self.mainContentView.tableView.forecastday = self.mainTableViewModel.mainTableViewModelForecastday
        self.mainContentView.tableView.tableview.reloadData()
        self.mainContentView.mainContentViewHeader.headerViewModel = self.mainCollectionViewMode.mainCollectionViewModel
    }
}


// MARK:- UISetup
extension MainViewController{
    
    
    fileprivate func setupNavigationBarItem(){
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        imageView.image = UIImage(named: "Carloudy_logo")
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: imageView)
        let searchBarItem = UIBarButtonItem(image: UIImage(named: "search_unselected"), style: .plain, target: self, action: #selector(searchBarButtonItemClicked))
        let gearItem = UIBarButtonItem(image: UIImage(named: "gear"), style: .plain, target: self, action: #selector(settingBarButtonItemClicked))
        navigationItem.rightBarButtonItems = [gearItem, searchBarItem]
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



extension MainViewController: CarloudyLocationDelegate{
    func carloudyLocation(speed: CLLocationSpeed) {
        
    }
    
    func carloudyLocation(locationName: String, street: String, city: String, zipCode: String, country: String) {
        let currentCity = city.replacingOccurrences(of: " ", with: "%20")
        ZJPrint(currentCity)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        self.loadData(currentCity: currentCity)
        }
        
    }
    
}



