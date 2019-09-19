//
//  TrackTableCellOne.swift
//  Practice_iTunesApp
//
//  Created by Sky on 9/18/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class TrackTableCellOne: UITableViewCell {

    @IBOutlet weak var trackAlbumImage: UIImageView!
    @IBOutlet weak var trackAlbumPrice: UIButton!
    @IBOutlet weak var trackCountLabel: UILabel!
    @IBOutlet weak var trackAlbumArtist: UILabel!
    @IBOutlet weak var trackAlbumName: UILabel!
    
    static let identifier = "TrackTableCellOne"
}
