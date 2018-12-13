//
//  SearchViewController.swift
//  Carloudy-Weather
//
//  Created by Zijia Zhai on 12/13/18.
//  Copyright © 2018 cognitiveAI. All rights reserved.
//

import UIKit

fileprivate let cellId = "cellId"

class SearchViewController: UIViewController {
    
    fileprivate lazy var searchViewModel = SearchViewModel()
    
    lazy var searchController : UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        searchController.searchBar.scopeButtonTitles = ["French", "English"]
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        return searchController
    }()
    
    lazy var tablView: UITableView = {[unowned self] in
       let tb = UITableView()
        tb.delegate = self
        tb.dataSource = self
        tb.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        return tb
    }()
    
    lazy var searchFirstView: SearchFirstView = {
        let sv = SearchFirstView()
        sv.isHidden = true
        return sv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        view.backgroundColor = .white
        searchController.searchBar.placeholder = "Add Locations"
//        tablView.reloadData()
    }

}


extension SearchViewController{
    fileprivate func setupUI(){
        view.addSubview(tablView)
        tablView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: navigationController?.navigationBar.bounds.maxY ?? 88, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        view.addSubview(searchFirstView)
        searchFirstView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: navigationController?.navigationBar.bounds.maxY ?? 88, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
}


extension SearchViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchViewModel.searchModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tablView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .default
        
        let data = searchViewModel.searchModels[indexPath.item]
        cell.textLabel?.text = data.location
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        ZJPrint(searchViewModel.searchModels[indexPath.item].location)
    }
}

extension SearchViewController: UISearchBarDelegate, UISearchResultsUpdating{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchViewModel.searchModels.removeAll()
        self.loadData(str: searchText)
        if searchText.count == 0{
            tablView.isHidden = true
            searchFirstView.isHidden = false
        }else{
            tablView.isHidden = false
            searchFirstView.isHidden = true
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
