//
//  ItunesAPI.swift
//  Practice_iTunesApp
//
//  Created by Sky on 9/17/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import Foundation

struct ItunesAPI {
    //https://itunes.apple.com/lookup?id=1437591818&entity=song -> Song
    //https://itunes.apple.com/search?term=jack+johnson&entity=album -> Album
    
    var search: String!
    var album: Album!
    
    init(search: String) {
        self.search = search
    }
    
    init(album: Album) {
        self.album = album
    }

    
    let base = "https://itunes.apple.com/"
    
    let lookup = "lookup?id="
    let songEntity = "&entity=song"
    
    let term = "search?term="
    let albumEntity = "&entity=album"
    
    var getAlbumUrl: URL? {
        return URL(string: base + term + search + albumEntity)
    }
    
    var getTrachUrl: URL? {
        return URL(string: base + lookup + "\(album.id)" + songEntity)
    }
    
}
