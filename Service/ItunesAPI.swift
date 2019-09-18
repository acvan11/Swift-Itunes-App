//
//  ItunesAPI.swift
//  Practice_iTunesApp
//
//  Created by Sky on 9/17/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import Foundation

struct ItunesAPI {
    
    //https://itunes.apple.com/search?term=jack+johnson&entity=album
    var search: String!
    
    init(search: String) {
        self.search = search
    }

    
    let base = "https://itunes.apple.com/search?term="
    let album = "&entity=album"
    
    var getUrl: URL? {
        return URL(string: base + search + album)
    }
    
}
