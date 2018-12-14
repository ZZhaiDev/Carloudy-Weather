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
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellId, for: indexPath) as! MainContentTableViewCell
        cell.backgroundColor = .clear
        
        return cell
    }
    
    
}
