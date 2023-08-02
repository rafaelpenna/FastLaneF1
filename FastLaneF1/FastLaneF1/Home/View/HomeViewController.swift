//
//  ViewController.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 14/07/23.
//

enum HomeTableViewSection: Int {
    case upcomingEvent
    case latestResults
    case championshipResults
    case schedule
}

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
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: UpcomingEventCell.identifier) as? UpcomingEventCell
            cell?.configure()
            let backgroundView = UIView()
            backgroundView.backgroundColor = .none
            cell?.selectedBackgroundView = backgroundView
            return cell ?? UITableViewCell()
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: LatestResultCell.identifier) as? LatestResultCell
            cell?.configure()
            let backgroundView = UIView()
            backgroundView.backgroundColor = .none
            cell?.selectedBackgroundView = backgroundView
            return cell ?? UITableViewCell()
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ChampionshipStandingsCell.identifier) as? ChampionshipStandingsCell
            cell?.configure()
            let backgroundView = UIView()
            backgroundView.backgroundColor = .none
            cell?.selectedBackgroundView = backgroundView
            return cell ?? UITableViewCell()
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ScheduleCell.identifier) as? ScheduleCell
            cell?.configure()
            let backgroundView = UIView()
            backgroundView.backgroundColor = .none
            cell?.selectedBackgroundView = backgroundView
            return cell ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
            self.tabBarController?.selectedIndex = 1
        } else if indexPath.row == 3 {
            self.tabBarController?.selectedIndex = 3
        }
    }
}
