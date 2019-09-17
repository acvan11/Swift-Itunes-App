//
//  Album.swift
//  Practice_iTunesApp
//
//  Created by Sky on 9/17/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import Foundation

struct AlbumResPonse: Decodable {
    let albums: [Album]
    private enum CodingKeys: String, CodingKey {
        case albums = "results"
    }
}

class Album: Decodable {
    let artist: String
    let image: String
    let title: String
    let price: Double
    let url: String
    let copyright: String
    let genre: String
    let releaseDate: String
    let trackCount: Int
    
    private enum CodingKeys: String, CodingKey {
        case artist = "artistName"
        case image = "artworkUrl100"
        case title = "collectionName"
        case price = "collectionPrice"
        case url = "collectionViewUrl"
        case genre = "primaryGenreName"
        case copyright, releaseDate, trackCount
    }
}
