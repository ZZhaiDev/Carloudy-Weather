//
//  SearchSecondViewCell.swift
//  Carloudy-Weather
//
//  Created by zijia on 12/13/18.
//  Copyright © 2018 cognitiveAI. All rights reserved.
//

import UIKit

class SearchSecondViewCell: UITableViewCell {
    
    lazy var imageV: UIImageView = { [unowned self] in
        let iv = UIImageView(frame: CGRect(x: 10, y: 10, width:  Int(zjScreenWidth - 10), height: Int(zjSeachFirstViewCellHeight - 20)))
        print(self.frame)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = UIImage(named: "download")
        return iv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        backgroundColor = .yellow
        self.selectionStyle = .none
        backgroundView = UIView()
        backgroundView!.addSubview(imageV)
        backgroundView?.alpha = 0.1
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        imageV.bounds = self.contentView.frame
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
