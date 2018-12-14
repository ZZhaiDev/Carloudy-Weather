//
//  MainContentViewCell.swift
//  Carloudy-Weather
//
//  Created by Zijia Zhai on 12/14/18.
//  Copyright © 2018 cognitiveAI. All rights reserved.
//

import UIKit

class MainContentViewCell: UICollectionViewCell {
    
    let imageView : UIImageView = {
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        let imageView  = UIImageView()
        imageView.image = UIImage(named: "rain_s_m")
        return imageView
    }()
    
    let timeLabel: UILabel = {
       let label = UILabel()
        label.text = "3:00"
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
        let stackView = UIStackView(arrangedSubviews: [imageView, timeLabel, tempLabel])
        
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        
        addSubview(stackView)
//        stackView.anchor(top: topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 12, paddingLeft: 12, paddingBottom: 0, paddingRight: 12, width: 0, height: 50)
        stackView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
