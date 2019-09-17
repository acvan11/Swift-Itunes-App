//
//  ViewController.swift
//  Practice_iTunesApp
//
//  Created by Sky on 9/17/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    
    @IBOutlet weak var mainListContainer: UIView!
    @IBOutlet weak var mainGridContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }

    @IBAction func switchButtonTapped(_ sender: UIBarButtonItem) {
        mainListContainer.isHidden.toggle()
        mainGridContainer.isHidden.toggle()
    }
    
}

