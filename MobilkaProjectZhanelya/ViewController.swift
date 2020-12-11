//
//  ViewController.swift
//  MobilkaProjectZhanelya
//
//  Created by Zhanelya Irmakhamed on 10/15/20.
//  Copyright © 2020 Zhanelya Irmakhamed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let networkService = NetworkService()
    var searchResponse: SearchResponse? = nil

    @IBOutlet weak var table: UITableView!
    
    @IBOutlet weak var image: UIImageView!
    
        @IBOutlet weak var nameLabel: UILabel!
                                   
//    let searchConctroller = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupTableView()
//        setupSearchBar()
        
      let urlString = "https://itunes.apple.com/search?term=Kairat&limit=13"
        

                                 networkService.request(urlString: urlString) { (result) in
                                     switch result{
                                         
                                     case .success(let searchResponse):
                                         self.searchResponse = searchResponse
                                         self.table.reloadData()
                                 
                                     case .failure(let error ):
                                         print("error: ",error)
                                     }
                                 }
        
    }
        

  
    
//    private func setupSearchBar(){
//        navigationItem.searchController = searchConctroller
////        searchConctroller.searchBar.delegate = self
//        navigationController?.navigationBar.prefersLargeTitles = true
//        searchConctroller.obscuresBackgroundDuringPresentation = false
//    }
    private func setupTableView(){
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResponse?.results.count ?? 00
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
    let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let track = searchResponse?.results[indexPath.row]
        cell.textLabel?.text = track?.trackName
        return cell
    }
    
    
}
