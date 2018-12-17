//
//  MainContentTableViewCell.swift
//  Carloudy-Weather
//
//  Created by Zijia Zhai on 12/14/18.
//  Copyright © 2018 cognitiveAI. All rights reserved.
//

import UIKit

class MainContentTableViewCell: UITableViewCell {
    @IBOutlet weak var weekDay: UILabel!
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var minTemp: UILabel!
    @IBOutlet weak var maxTemp: UILabel!
    
    
    
    var tableViewCellMode: Forecastday?{
        didSet{
            if let date = tableViewCellMode?.date{
                weekDay.text = date
            }
            
            if let day = tableViewCellMode?.day{
                if let maxtemp_c = day.maxtemp_c, let mintemp_c = day.mintemp_c{
                    self.minTemp.text = String(Int(mintemp_c)) + "°"
                    self.maxTemp.text = String(Int(maxtemp_c)) + "°"
                }
                if let condition = day.condition{
                    if let icon = condition.icon{
                        if let iconName = icon.components(separatedBy: "/").last{
                            imageV.image = UIImage(named: iconName)
                        }
                    }
                }
            }
            
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    fileprivate func setupUI(){
        minTemp.textAlignment = .center
        maxTemp.textAlignment = .center
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
