//
//  MainContentCollectionView.swift
//  Carloudy-Weather
//
//  Created by Zijia Zhai on 12/14/18.
//  Copyright © 2018 cognitiveAI. All rights reserved.
//

import UIKit

//fileprivate let cellId = "cellId"
//fileprivate let headerCellId = "headerCellId"



class MainContentView: UIView {
    fileprivate var titles: [String]
    
    lazy var mainContentViewHeader: MainContentViewHeader = {
        let header = MainContentViewHeader(frame: CGRect(x: 0, y: 0, width: zjScreenWidth, height: 200))
        return header
    }()
    
    
    lazy var collectionView : MainCollectionView = {
        let cv = MainCollectionView(frame: CGRect(x: 0, y: 200, width: zjScreenWidth, height: 100))
//        cv.backgroundColor = .yellow
        return cv
    }()
    
//    fileprivate lazy var topHeaderView : MainContentViewCellHeader = {
//        let headerView = MainContentViewCellHeader()
//        headerView.frame = CGRect(x: 0, y: 0, width: zjScreenWidth, height: 200)
//
//        return headerView
//    }()
    
    let tableView: MainContentTableView = {
        let tv = MainContentTableView(frame: CGRect(x: 0, y: 320, width: zjScreenWidth, height: zjScreenHeight - 300))
        tv.backgroundColor = .clear
//        tv.backgroundColor = .red
        return tv
    }()
    
    fileprivate lazy var collectionViewCell : MainContentViewCell = {
        let headerView = MainContentViewCell()
        return headerView
    }()
    
    

    init(frame: CGRect, titles: [String]) {
        self.titles = titles
        super.init(frame: frame)
//        backgroundColor = .gray
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI(){
//        addSubview(timeLabel)
//        timeLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 30, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
//        collectionView.addSubview(topHeaderView)
//        topHeaderView.anchor(top: collectionView.topAnchor, left: collectionView.leftAnchor, bottom: nil, right: collectionView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 200)
        addSubview(mainContentViewHeader)
        
        addSubview(collectionView)
//        collectionView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(tableView)
//        tableView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 310, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
}

//extension MainContentView: UICollectionViewDelegate, UICollectionViewDataSource{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 12
//    }
//
////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//////        let width = (view.frame.width - 4)/3
////        return CGSize(width: 75, height: 150)
////    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MainContentViewCell
////        cell.backgroundColor = UIColor.blue
//        return cell
//    }
//
////    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
////        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerCellId, for: indexPath) as! MainContentViewCellHeader
//////        header.backgroundColor = .blue
////        return header
////    }
//
////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
////        return CGSize(width: self.frame.width, height: 200)
////    }
//
//
//}
//
//
////extension MainContentView: UITableViewDelegate, UITableViewDataSource{
////    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        return 4
////    }
////
////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellId, for: indexPath)
////        cell.backgroundColor = .red
////        return cell
////    }
////
////
////}
