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

extension ScheduleViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return racesViewModel.numberOfRows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScheduleCustomCollectionViewCell.identifier, for: indexPath) as? ScheduleCustomCollectionViewCell
        cell?.setupCell(driver: racesViewModel.loadCurrentRace(indexPath: indexPath))
        let backgroundView = UIView()
        backgroundView.backgroundColor = .none
        cell?.selectedBackgroundView = backgroundView
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = StandingsViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        vc.selectedRound = indexPath.row
        vc.circuitCountryNameLabel = racesViewModel.getRaceCountry(indexPath: indexPath)
    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = StandingsViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
//        vc.selectedRound = indexPath.row
//        vc.circuitCountryNameLabel = racesViewModel.getRaceCountry(indexPath: indexPath)
//    }
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
        DispatchQueue.main.async {
            self.racesScreen?.infoRacesCollectionView.reloadData()
        }
    }
}
