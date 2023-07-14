//
//  ViewController.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 14/07/23.
//

import UIKit

class HomeViewController: UIViewController {

    var homeScreen = HomeScreenView()
    
    override func loadView() {
        homeScreen = HomeScreenView()
        view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    


}

