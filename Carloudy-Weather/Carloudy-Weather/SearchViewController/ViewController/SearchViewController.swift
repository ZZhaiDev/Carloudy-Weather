//
//  SearchViewController.swift
//  Carloudy-Weather
//
//  Created by Zijia Zhai on 12/13/18.
//  Copyright © 2018 cognitiveAI. All rights reserved.
//

import UIKit

fileprivate let searchcellId = "searchcellId"
fileprivate let cellId = "cellId"

class SearchViewController: UIViewController {
    
    fileprivate lazy var searchViewModel = SearchViewModel()
    var firstView = true
    
    lazy var searchController : UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
//        searchController.searchBar.scopeButtonTitles = ["French", "English"]
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        return searchController
    }()
    
    lazy var tablView: UITableView = {[unowned self] in
       let tb = UITableView()
        tb.delegate = self
        tb.dataSource = self
        tb.rowHeight = zjSeachFirstViewCellHeight
        
        return tb
    }()
    
//    lazy var searchFirstView: SearchFirstView = {
//        let sv = SearchFirstView()
//        sv.isHidden = true
//        return sv
//    }()
    
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.navigationController?.hidesBarsOnSwipe = true;
        }
    
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            self.navigationController?.hidesBarsOnSwipe = false;
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        view.backgroundColor = .white
        searchController.searchBar.placeholder = "Add Locations"
        
        tablView.register(SearchSecondViewCell.self, forCellReuseIdentifier: cellId)
        tablView.register(SearchFirstViewCell.self, forCellReuseIdentifier: searchcellId)
        tablView.reloadData()
    }

}


extension SearchViewController{
    fileprivate func setupUI(){
        view.addSubview(tablView)
        tablView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
//        view.addSubview(searchFirstView)
//        searchFirstView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: navigationController?.navigationBar.bounds.maxY ?? 88, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "< back", style: .plain, target: self, action: #selector(goback))
    }
    
    @objc fileprivate func goback(){
        self.dismiss(animated: true, completion: nil)
    }
}


extension SearchViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        if firstView{
            return 2
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if firstView{
            if section == 0{
                return 1
            }
            return 9
        }
        return searchViewModel.searchModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if firstView{
            let cell = tablView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SearchSecondViewCell
            cell.textLabel?.text = "123"
            return cell
        }else{
            let cell = tablView.dequeueReusableCell(withIdentifier: searchcellId, for: indexPath) as! SearchFirstViewCell
            cell.accessoryType = .disclosureIndicator
            cell.selectionStyle = .default
            
            let data = searchViewModel.searchModels[indexPath.item]
            cell.textLabel?.text = data.location
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if firstView{
            if section == 0{
                return "Current Location"
            }
            return "My Locations"
        }
        return ""
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if firstView{
            
        }else{
            ZJPrint(searchViewModel.searchModels[indexPath.item].location)
        }
        
    }
}

extension SearchViewController: UISearchBarDelegate, UISearchResultsUpdating{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchViewModel.searchModels.removeAll()
        ZJPrint(searchText.count)
        if searchText.count == 0{
            firstView = true
            tablView.rowHeight = 160
            tablView.reloadData()
        }else{
            firstView = false
            tablView.rowHeight = 80
            self.loadData(str: searchText.replacingOccurrences(of: " ", with: ""))
        }
        
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
    }
}


// MARK:- 网络请求
extension SearchViewController{
    fileprivate func loadData(str: String){
        searchViewModel.loadCitiesData(str: str, finishesCallBack: {
            DispatchQueue.main.async {
                self.tablView.reloadData()
            }
        })
    }
}
