//
//  MainContentTableView.swift
//  Carloudy-Weather
//
//  Created by Zijia Zhai on 12/14/18.
//  Copyright © 2018 cognitiveAI. All rights reserved.
//

import UIKit


fileprivate let tableViewCellId = "tableViewCellId"
class MainContentTableView: UIView {
    
    var forecastday: [Forecastday]?
    
    lazy var tableview: UITableView = {
       let tv = UITableView()
        tv.register(UINib(nibName: "MainContentTableViewCell", bundle: nil), forCellReuseIdentifier: tableViewCellId)
        tv.backgroundColor = .clear
        tv.dataSource = self
        tv.delegate = self
        return tv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        addSubview(tableview)
        tableview.frame = self.bounds
//        tableview.backgroundColor = .red
        
    }
}

extension MainContentTableView: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = forecastday?.count else { return 0 }
        return min(count, 5)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellId, for: indexPath) as! MainContentTableViewCell
        cell.backgroundColor = .clear
        cell.tableViewCellMode = self.forecastday![indexPath.item]
        return cell
    }
    
    
}
