//
//  AlbumTableCell.swift
//  Practice_iTunesApp
//
//  Created by Sky on 9/17/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class AlbumTableCell: UITableViewCell {
    
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var albumMainLabel: UILabel!
    @IBOutlet weak var albumSubLabel: UILabel!
    
    static let identifier = "AlbumTableCell"
    
    var album: Album! {
        didSet {
            albumMainLabel.text = album.title
            albumSubLabel.text = album.artist
            album.getImage{ [weak self] img in
                self?.albumImage.image = img
            }
        }
    }
}

