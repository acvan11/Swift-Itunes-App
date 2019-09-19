//
//  TrackTableCellTwo.swift
//  Practice_iTunesApp
//
//  Created by Sky on 9/18/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class TrackTableCellTwo: UITableViewCell {

    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var trackDuration: UILabel!
    @IBOutlet weak var trackPrice: UILabel!
    
    static let identifier = "TrackTableCellTwo"
 
    var track: Track! {
        didSet {
            trackName.text = track.name
            trackDuration.text = "\(track.duration)"
            trackPrice.text = "\(track.price)"
        }
    }
}
