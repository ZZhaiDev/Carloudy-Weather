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
    private lazy var mainContentViewHeader = MainContentViewHeader()
    
    
    lazy var labelView: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name:"PartyLetPlain",size:25)
        label.text = "Carloudy-Weather"
        return label
    }()
    
    
    var titles = [""]
    var addedTitles = false
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
//        mainContentViewHeader.delegate = self
        carloudyLocation.locationManager.requestAlwaysAuthorization()
        carloudyLocation.locationManager.startUpdatingLocation()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func setupUI() {
        contentView = mainContentView
        view.addSubview(mainContentView)
        navigationItem.titleView = labelView
        setupNavigationBarItem()
        super.setupUI()
    }
}



// MARK:- API CALL
extension MainViewController{
    func loadData(currentCity: String){
        let timestampNow = NSDate().timeIntervalSince1970
        let defaults = UserDefaults.standard
        let jsonString = defaults.string(forKey: currentCity.lowercased())
        
        if jsonString != nil{       //不为空才检查
            if let data = jsonString?.data(using: .utf8){
                do {
                    let json = try JSONDecoder().decode(CatchWeatherData.self, from: data)
                    if let timestamp = json.timeStamp, let tableViewModel = json.tableViewData, let collectionModel = json.collectionData {
                        if timestampNow - timestamp < 3600{  //小于1小时不更新
                            if let lists = collectionModel.list{
                                self.reloadCollectionData(lists: lists, mainCollectionViewData: collectionModel)
                            }
                            if let forecast = tableViewModel.forecast, let forecastday = forecast.forecastday{
                                self.reloadTableData(forecastdays: forecastday)
                            }
                            loadDataFinished()
                            return
                        }
                    }
                } catch let jsonError {
                    ZJPrint(jsonError)
                }
            }
        }
        
        var collectionData: CollectionModel?
        var tableViewData: TableModel?
        
        ZJPrint("********************************************************")
        ZJPrint("     *********************************************")
        ZJPrint("           **************************")
        ZJPrint("                  重新call 数据了")
        ZJPrint("           **************************")
        ZJPrint("     *********************************************")
        ZJPrint("********************************************************")
        
        mainCollectionViewMode.loadWeatherData(str: currentCity) {
            DispatchQueue.main.async {
                collectionData = self.mainCollectionViewMode.mainCollectionViewModel
                self.saveData(collectionData: collectionData, tableViewData: tableViewData, currentCity: currentCity)
                // 传送数据 并刷新
                self.reloadCollectionData(lists: self.mainCollectionViewMode.mainCollectionViewModelList, mainCollectionViewData: self.mainCollectionViewMode.mainCollectionViewModel)
            }
            
        }
        mainTableViewModel.loadAPIUXWeather(city: currentCity) {
            DispatchQueue.main.async {
                tableViewData = self.mainTableViewModel.mainContentViewHeaderMode_all
                self.saveData(collectionData: collectionData, tableViewData: tableViewData, currentCity: currentCity)
                self.reloadTableData(forecastdays: self.mainTableViewModel.mainTableViewModelForecastday)
            }
            
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
    }
    
    fileprivate func reloadCollectionData(lists: [List], mainCollectionViewData: CollectionModel){
        
        self.mainContentView.collectionView.list = lists
        self.mainContentView.collectionView.collectionView.reloadData()
        self.mainContentView.mainContentViewHeader.headerViewModel = mainCollectionViewData
    }
    
    fileprivate func reloadTableData(forecastdays: [Forecastday]){
        var forecastdayTemp = forecastdays
        if forecastdayTemp.count > 0{
            forecastdayTemp.removeFirst() //remove 当天数据
        }
        self.mainContentView.tableView.forecastday = forecastdayTemp
        self.mainContentView.tableView.tableview.reloadData()
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
//        let setVC = SearchViewController()
//        let nvc = UINavigationController(rootViewController: setVC)
//        self.present(nvc, animated: true, completion: nil)
    }
    
    @objc fileprivate func settingBarButtonItemClicked(){
        let setVC = SettingViewController()
        setVC.mainViewController = self
        let nvc = UINavigationController(rootViewController: setVC)
        self.present(nvc, animated: true, completion: nil)
    }
}



extension MainViewController: CarloudyLocationDelegate{
    func carloudyLocation(speed: CLLocationSpeed) {
        
    }
    
    func carloudyLocation(locationName: String, street: String, city: String, zipCode: String, country: String) {
        let currentCity = city.replacingOccurrences(of: " ", with: "%20")
        currentCity_ = currentCity
        
        if addedTitles == false{
            titles = [city]
            self.view.addSubview(pageTitleView)
            addedTitles = true
        }
        
        ZJPrint(currentCity)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        self.loadData(currentCity: currentCity)
        }
    }
    
//    func mainContentViewHeader(temperature: String, weather: String) {
//        
//    }
}



