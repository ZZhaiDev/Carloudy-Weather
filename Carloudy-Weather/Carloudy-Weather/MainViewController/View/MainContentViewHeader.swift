//
//  MainContentViewCellHeader.swift
//  Carloudy-Weather
//
//  Created by Zijia Zhai on 12/14/18.
//  Copyright © 2018 cognitiveAI. All rights reserved.
//

import UIKit

class MainContentViewHeader: UIView {
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "Friday, 14 December, 12: 06"
        label.textAlignment = .center
//        label.backgroundColor = .red
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "Chicago, United States"
        label.textAlignment = .center
        return label
    }()
    
    let imageView: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(named: "fog_b")
        return iv
    }()
    
    let tempLabel: UILabel = {
       let label = UILabel()
        label.text = "45°"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 55)
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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
