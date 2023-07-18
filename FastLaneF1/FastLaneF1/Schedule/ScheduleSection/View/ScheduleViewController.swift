//
//  ScheduleViewController.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 18/07/23.
//

import UIKit

class ScheduleViewController: UIViewController {
    
    var racesScreen: ScheduleScreen?
    let racesViewModel: ScheduleViewModel = ScheduleViewModel()
    
    override func loadView() {
        racesScreen = ScheduleScreen()
        view = racesScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProtocols()
        racesViewModel.fetchSchedule(.request)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setupProtocols() {
        racesViewModel.delegate(delegate: self)
    }
}

extension ScheduleViewController: UITableViewDelegate, UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return racesViewModel.numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ScheduleCustomTableViewCell.identifier) as? ScheduleCustomTableViewCell
        cell?.setupCell(driver: racesViewModel.loadCurrentRace(indexPath: indexPath))
        let backgroundView = UIView()
        backgroundView.backgroundColor = .none
        cell?.selectedBackgroundView = backgroundView
        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = StandingsViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        vc.selectedRound = indexPath.row
        vc.circuitCountryNameLabel = racesViewModel.getRaceCountry(indexPath: indexPath)
    }
}

extension ScheduleViewController: ScheduleViewModelDelegate {
    func success() {
        racesScreen?.setupTableViewProtocols(delegate: self, dataSource: self)
        reloadTableView()
    }
    
    func error(_ message: String) {
    }
}

extension ScheduleViewController: ScheduleViewModelProtocol {
    func reloadTableView() {
        self.racesScreen?.infoRacesTableView.reloadData()
    }
}
