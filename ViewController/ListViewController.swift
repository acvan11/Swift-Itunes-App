//
//  ListViewController.swift
//  Practice_iTunesApp
//
//  Created by Sky on 9/17/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var listTableView: UITableView!
    
    var viewModel = ViewModel(){
        didSet {
            self.listTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupList()
//        listTableView.backgroundColor = .red
    }
    
    private func setupList() {
        //you must register XIB to table view
        listTableView.register(UINib(nibName: AlbumTableCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: AlbumTableCell.identifier)
        
        // what's for???
        // remove extra unused cells
        listTableView.tableFooterView = UIView(frame: .zero)
        
        NotificationCenter.default.addObserver(forName: Notification.Name.AlbumNotification, object: nil, queue: .main){ note in
            guard let userInfo = note.userInfo as? [String:ViewModel] else { return }
            
            self.viewModel = userInfo["ViewModel"]!

        }
    }
    


}

extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return viewModel.albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AlbumTableCell.identifier, for: indexPath) as! AlbumTableCell
        let album = viewModel.albums[indexPath.row]
        cell.album = album
        return cell
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let album = viewModel.albums[indexPath.row]
        viewModel.currentAlbum = album
        goToDetail(with: viewModel)
        
    }
}
