//
//  MainContentViewCellHeader.swift
//  Carloudy-Weather
//
//  Created by Zijia Zhai on 12/14/18.
//  Copyright © 2018 cognitiveAI. All rights reserved.
//

import UIKit

class MainContentViewHeader: UIView {
    var headerViewModel: CollectionModel?{
        didSet{
            guard let data = headerViewModel else { return }
            guard let lists = data.list else { return }
            guard let firstList = lists.first else { return }
            guard let dt = firstList.dt else { return }  //1545069600
            
            
            guard let main = firstList.main else { return }
            guard let temp = main.temp else { return }
            tempLabel.text = getTemperatureStr(Imperial: temp)
            guard let temp_max = main.temp_max else { return }
            guard let temp_min = main.temp_min else { return }
            tempSmallLabel.text = "Min " + getTemperatureStr(Imperial: temp_min) + "° | Max " + getTemperatureStr(Imperial: temp_max) + "°"
            
            
            
            guard let weathers = firstList.weather else { return }
            guard let firstWeather = weathers.first else { return }
            guard let description = firstWeather.description else { return }
            timeLabel.text = Date.dateSince1970(timeStamp: Double(dt), formate: "yyyy-MM-dd") + ": \(description)" 
            guard let icon = firstWeather.icon else { return }
            imageView.image = UIImage(named: icon)
            
            guard let city = data.city, let name = city.name, let country = city.country else { return }
            locationLabel.text = name + "," + country
//
//            guard let location = data.location else { return }
//            guard let name = location.name, let region = location.region else {return}
//            locationLabel.text = name + "," + region
//            
//            
//            guard let current = data.current else { return }
//            guard let last_updated = current.last_updated else {return}
//            timeLabel.text = last_updated
//            
//            guard let condition = current.condition else { return }
//            guard let icon = condition.icon else { return }
//            if let iconName = icon.components(separatedBy: "/").last{
//                imageView.image = UIImage(named: iconName)
//            }
//            
//            guard let temp_c = current.temp_c else {return}
//            tempLabel.text = String(Int(temp_c + 0.5)) + "°"
            
        }
    }
//    var headerViewModel: Current?{
//        didSet{
//            guard let data = headerViewModel else { return }
//            guard let last_updated = data.last_updated else {return}
//            timeLabel.text = last_updated
//
//            guard let condition = data.condition else { return }
//            guard let icon = condition.icon else { return }
//            if let iconName = icon.components(separatedBy: "/").last{
//                imageView.image = UIImage(named: iconName)
//            }
//
//            guard let temp_c = data.temp_c else {return}
//            tempLabel.text = String(Int(temp_c + 0.5)) + "°"
//
//        }
//    }
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12)
//        label.text = "Friday, 14 December, 12: 06"
        label.textAlignment = .center
//        label.backgroundColor = .red
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 14)
//        label.text = "Chicago, United States"
        label.textAlignment = .center
        return label
    }()
    
    let imageView: UIImageView = {
       let iv = UIImageView()
//        iv.image = UIImage(named: "fog_b")
        return iv
    }()
    
    let tempLabel: UILabel = {
       let label = UILabel()
//        label.text = "45°"
        label.textColor = .white
        label.font = UIFont(name:"PartyLetPlain",size:55)
//        label.font = UIFont.systemFont(ofSize: 55)
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
