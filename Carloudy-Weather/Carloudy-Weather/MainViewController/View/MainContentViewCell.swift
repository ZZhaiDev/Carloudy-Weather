//
//  MainContentViewCell.swift
//  Carloudy-Weather
//
//  Created by Zijia Zhai on 12/14/18.
//  Copyright © 2018 cognitiveAI. All rights reserved.
//

import UIKit

class MainContentViewCell: UICollectionViewCell {
    var collectionViewMode: List?{
        didSet{
            if let main = collectionViewMode?.main{
                if let temp = main.temp{
                   tempLabel.text = getTemperatureStr(Imperial: temp)
                   
                }
            }
            if let weathers = collectionViewMode?.weather{
                for weather in weathers{
                    if let icon = weather.icon{
                        imageView.image = UIImage(named: icon)
                    }
                }
            }
            if let dt = collectionViewMode?.dt{
                timeLabel.text = Date.dateSince1970(timeStamp: Double(dt))
//                ZJPrint(timeLabel.text)
            }
            
        }
    }
    let imageView : UIImageView = {
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        let imageView  = UIImageView()
        imageView.image = UIImage(named: "rain_s_m")
        return imageView
    }()
    
    let timeLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let tempLabel: UILabel = {
        let label = UILabel()
        label.text = "37."
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .white
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        backgroundColor = .blue
        setupUserStatsView()
    }
    
    fileprivate func setupUserStatsView() {
//        let stackView = UIStackView(arrangedSubviews: [imageView, timeLabel, tempLabel])
//        stackView.axis = .vertical
//        stackView.distribution = .fillProportionally
//        addSubview(stackView)
//        stackView.anchor(top: topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 12, paddingLeft: 12, paddingBottom: 0, paddingRight: 12, width: 0, height: 50)
        addSubview(imageView)
        imageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 50, height: 50)
        
        addSubview(timeLabel)
        timeLabel.anchor(top: imageView.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 50, height: 20)
        
        addSubview(tempLabel)
        tempLabel.anchor(top: timeLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 50, height: 30)
//        stackView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
