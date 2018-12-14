//
//  MainContentViewCellHeader.swift
//  Carloudy-Weather
//
//  Created by Zijia Zhai on 12/14/18.
//  Copyright © 2018 cognitiveAI. All rights reserved.
//

import UIKit

class MainContentViewCellHeader: UICollectionReusableView {
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func setupUI(){
        addSubview(timeLabel)
        timeLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
        
        addSubview(locationLabel)
        locationLabel.anchor(top: timeLabel.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
        
        addSubview(imageView)
        imageView.anchor(top: locationLabel.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 30, paddingLeft: 30, paddingBottom: 0, paddingRight: 0, width: 80, height: 80)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
