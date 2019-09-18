//
//  ViewController.swift
//  Practice_iTunesApp
//
//  Created by Sky on 9/17/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    
    @IBOutlet weak var mainListContainer: UIView!
    @IBOutlet weak var mainGridContainer: UIView!
    
    let searchController = UISearchController(searchResultsController: nil)
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMain()
    }

    @IBAction func switchButtonTapped(_ sender: UIBarButtonItem) {
           mainGridContainer.isHidden.toggle()
        mainListContainer.isHidden.toggle()
     
    }
    
    private func setupMain() {
        viewModel.get(search: "lil+wayne")
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search itunes album..."
        searchController.searchBar.delegate = self
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        //????? what's for?
        definesPresentationContext = true
    }
    
}

//UISearchBarDelegate

extension MainViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        
        viewModel.get(search: searchText)
        navigationItem.searchController?.isActive = false
    }
    
}
