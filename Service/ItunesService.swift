//
//  ItunesService.swift
//  Practice_iTunesApp
//
//  Created by Sky on 9/17/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import Foundation

typealias AlbumHandler = ([Album]) -> Void
typealias TrackHandler = ([Track]) -> Void

final class ItunesService {
    
    static let shared = ItunesService()
    private init() {}
    
    func getAlbums(for search: String, completion: @escaping AlbumHandler) {
        guard let url = ItunesAPI(search: search).getAlbumUrl else {
            completion([])
            return
        }
        
        URLSession.shared.dataTask(with: url) { (dat, _, err) in
            if let error = err {
                print("Bad Task: \(error.localizedDescription)")
                completion([])
                return
            }
            
            if let data = dat {
                
                do {
                    let albumResponse = try JSONDecoder().decode(AlbumResponse.self, from: data)
                    let albums = albumResponse.albums
//                    print("okay")
//                    print(albums)
                    completion(albums)
                } catch let myError {
                    print("Couldn't Decode Album: \(myError.localizedDescription)")
                    completion([])
                    return
                }
            }
            }.resume()
    }
    
    func getTracks(for album: Album, completion: @escaping TrackHandler) {
        
        guard let url = ItunesAPI(album: album).getTrachUrl else {
            completion([])
            return
        }
        
        URLSession.shared.dataTask(with: url) { (dat, _, err) in
            if let error = err {
                print("Bad Task: \(error.localizedDescription)")
                completion([])
                return
            }
            
            if let data = dat {
                do {
                    let trackResponse = try JSONDecoder().decode(TrackResponse.self, from: data)
                    let tracks = Array(trackResponse.results.dropFirst())
                    completion(tracks)
                } catch {
                    print("Couldn't Decode track: \(error.localizedDescription)")
                    completion([])
                    return
                }
            }
            
            }.resume()
    }
}
