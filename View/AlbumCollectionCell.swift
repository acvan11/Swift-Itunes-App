//
//  AlbumCollectionCell.swift
//  Practice_iTunesApp
//
//  Created by Sky on 9/17/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class AlbumCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var albumLabel: UILabel!
    
    static let identifier = "AlbumCollectionCell"
    
    var album: Album! {
        didSet {
            albumLabel.text = album.title
            
            album.getImage { [weak self] img in
                self?.albumImage.image = img
            }
        }
    }
}
