//
//  MainContentViewCellHeader.swift
//  Carloudy-Weather
//
//  Created by Zijia Zhai on 12/14/18.
//  Copyright © 2018 cognitiveAI. All rights reserved.
//

import UIKit
//var currentTemp_: Int?

public protocol MainContentViewHeaderDelegate {
    ///
    ///
    /// - Parameters:
    ///   - temperature: 29°
    ///   - weather: Clouds
    ///   - icon: 01. (所有都是day，没有night)
    func mainContentViewHeader(temperature: String, weather: String, icon: String)
}

class MainContentViewHeader: UIView {
    var headerViewModel: CollectionModel?{
        didSet{
            guard let data = headerViewModel else { ZJPrint("errror*********errror*********errror*********errror*********"); return }
            guard let lists = data.list else { ZJPrint("errror*********errror*********errror*********errror*********"); return }
            guard let firstList = lists.first else { ZJPrint("errror*********errror*********errror*********errror*********"); return }
            guard let dt = firstList.dt else { ZJPrint("errror*********errror*********errror*********errror*********"); return }  //1545069600
            
            
            guard let main = firstList.main else {ZJPrint("errror*********errror*********errror*********errror*********"); return }
            guard let temp = main.temp else { ZJPrint("errror*********errror*********errror*********errror*********"); return }
            tempLabel.text = getTemperatureStr(Imperial: temp)
            guard let temp_max = main.temp_max else { ZJPrint("errror*********errror*********errror*********errror*********"); return }
            guard let temp_min = main.temp_min else { ZJPrint("errror*********errror*********errror*********errror*********");return }
            tempSmallLabel.text = "Min " + getTemperatureStr(Imperial: temp_min) + " | Max " + getTemperatureStr(Imperial: temp_max)
            
            
            
            guard let weathers = firstList.weather else { ZJPrint("errror*********errror*********errror*********errror*********"); return }
            guard let firstWeather = weathers.first else { ZJPrint("errror*********errror*********errror*********errror*********"); return }
            guard let weatherMain = firstWeather.main else { ZJPrint("errror*********errror*********errror*********errror*********"); return }
            
            guard let description = firstWeather.description else { ZJPrint("errror*********errror*********errror*********errror*********"); return }
            timeLabel.text = Date.dateSince1970(timeStamp: Double(dt), formate: "yyyy-MM-dd") + ": \(description)"
            
            guard let icon = firstWeather.icon else { ZJPrint("errror*********errror*********errror*********errror*********"); return }
            let iconNameForCarloudy = icon.dropLast()
            ZJPrint(iconNameForCarloudy)
//            iconNameForCarloudy.dropLast()
            delegate?.mainContentViewHeader(temperature: tempLabel.text ?? "", weather: weatherMain, icon: String(iconNameForCarloudy))
            imageView.image = UIImage(named: icon)
            
            guard let city = data.city, let name = city.name, let country = city.country else {ZJPrint("errror*********errror*********errror*********errror*********"); return }
            locationLabel.text = name + "," + country
        }
    }
    
    open var delegate : MainContentViewHeaderDelegate?
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
    let imageView: UIImageView = {
       let iv = UIImageView()
        return iv
    }()
    
    let tempLabel: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name:"PartyLetPlain",size:55)
        return label
    }()
    
    let tempSmallLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func setupUI(){
        let leftPadding: CGFloat = zjScreenWidth/6
        let imageWidth: CGFloat = 80
        
        addSubview(timeLabel)
        timeLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
        
        addSubview(locationLabel)
        locationLabel.anchor(top: timeLabel.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
        
        addSubview(imageView)
        imageView.anchor(top: locationLabel.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 30, paddingLeft: leftPadding, paddingBottom: 0, paddingRight: 0, width: imageWidth, height: imageWidth)
        
        addSubview(tempLabel)
        tempLabel.anchor(top: imageView.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: zjScreenWidth - leftPadding - imageWidth, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(tempSmallLabel)
        tempSmallLabel.centerXAnchor.constraint(equalTo: tempLabel.centerXAnchor).isActive = true
        tempSmallLabel.anchor(top: tempLabel.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
