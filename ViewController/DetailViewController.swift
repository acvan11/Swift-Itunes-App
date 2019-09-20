//
//  DetailViewController.swift
//  Practice_iTunesApp
//
//  Created by Sky on 9/18/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailTableView: UITableView!
    
    var viewModel: ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDetail()
    }
    
    private func setupDetail() {
        viewModel.delegate = self
    }

}

//MARK: TableView
extension DetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : viewModel.tracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
       
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: TrackTableCellOne.identifier, for: indexPath) as! TrackTableCellOne
            cell.album = viewModel.currentAlbum
            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: TrackTableCellTwo.identifier, for: indexPath) as! TrackTableCellTwo
            let track = viewModel.tracks[indexPath.row]
            cell.track = track
            return cell
        }
    }
}

extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
//    return 130
    }
}

//MARK: TrackDelegate
extension DetailViewController: TrackDelegate {
    func update() {
        DispatchQueue.main.async {
            self.detailTableView.reloadData()
        }
    }
}
