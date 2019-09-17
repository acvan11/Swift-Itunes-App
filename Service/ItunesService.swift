//
//  ItunesService.swift
//  Practice_iTunesApp
//
//  Created by Sky on 9/17/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import Foundation

typealias AlbumHandler = ([Album]) -> Void

final class ItunesService {
    
    static let shared = ItunesService()
    private init() {}
    
    func getAlbums(for search: String, completion: @escaping AlbumHandler) {
        
    }
}
