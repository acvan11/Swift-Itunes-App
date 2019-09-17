//
//  ViewModel.swift
//  Practice_iTunesApp
//
//  Created by Sky on 9/17/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import Foundation

class ViewModel {
    
    /*ViewModel - main goal is to only allow the view controller to worry about the views
     1. Data,
     2. Service Calls,
     3. Business Logic
     4. Data Binding - connecting a view to a data source - Property Observer & Communication Pattern
    */
    
    var albums = [Album]() {
        didSet {
            let userInfo: [String:ViewModel] = ["ViewModel":self]
            NotificationCenter.default.post(name: Notification.Name.AlbumNotification, object: nil, userInfo: userInfo)
    
        }
    }
    
    
    func get(search: String) {
        
        ItunesService.shared.getAlbums(for: search) { [weak self] albms in
            self?.albums = albms
            print("Album Count: \(albms.count)")
            
        }
    }
    
}
