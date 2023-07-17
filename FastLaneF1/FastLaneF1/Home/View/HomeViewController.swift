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
        setupProtocols()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setupProtocols() {
        homeScreen.setupTableViewProtocols(delegate: self, dataSource: self)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as? HomeTableViewCell
        let backgroundView = UIView()
        backgroundView.backgroundColor = .none
        cell?.selectedBackgroundView = backgroundView
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}


