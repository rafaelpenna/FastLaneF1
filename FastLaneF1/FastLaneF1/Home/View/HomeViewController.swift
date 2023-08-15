//
//  ViewController.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 14/07/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeScreen: HomeScreenView?
    let nextEventViewModel: NextEventViewModel = NextEventViewModel()
    let lastResultViewModel: LastResultViewModel = LastResultViewModel()

    
    override func loadView() {
        homeScreen = HomeScreenView()
        view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupProtocols()
        loadData()
    }
    
    private func loadData() {
        lastResultViewModel.fetchLastResult()
        nextEventViewModel.fetchNextEvent()
        setupProtocols()
    }
    
    private func setupProtocols() {
        nextEventViewModel.delegate(delegate: self)
        lastResultViewModel.delegate(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: LastResultCell.identifier, for: indexPath) as? LastResultCell
            cell?.configure()
            cell?.delegate(delegate: self)
            let backgroundView = UIView()
            backgroundView.backgroundColor = .none
            cell?.selectedBackgroundView = backgroundView
            cell?.circuitName.text = lastResultViewModel.circuitCountry
            cell?.firstPlace.text = "Winner: \(lastResultViewModel.driverFirstPlace)"
            cell?.flagCountryEvent.image = lastResultViewModel.countryLastEvent
            return cell ?? UITableViewCell()
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: UpcomingEventCell.identifier, for: indexPath) as? UpcomingEventCell
            cell?.configure()
            cell?.delegate(delegate: self)
            let backgroundView = UIView()
            backgroundView.backgroundColor = .none
            cell?.selectedBackgroundView = backgroundView
            cell?.countryRaceName.text = nextEventViewModel.nameNextEvent
            cell?.circuitName.text = nextEventViewModel.circuitNameNextEvent
            cell?.flagCountryEvent.image = nextEventViewModel.countryNextEvent
            cell?.dateEvent.text = nextEventViewModel.dateNextEvent
            return cell ?? UITableViewCell()
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300

    }
}


extension HomeViewController: NextEventViewModelDelegate, LastResultViewModelDelegate {
    func success() {
        homeScreen?.setupTableViewProtocols(delegate: self, dataSource: self)
        nextEventReloadTableView()
    }
    func error(_ message: String) {
    }
}

extension HomeViewController: NextEventViewModelProtocol {
    func nextEventReloadTableView() {
        DispatchQueue.main.async { [self] in
            homeScreen?.homeTableView.reloadData()
        }
    }
}
extension HomeViewController: LastResultButtonTableViewCellProtocol{
    func moreInformationActionButton() {
        let vc = LastResultViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: BuyTicketButtonTableViewCellProtocol{
    func buyTicketActionButton() {
        if let url = URL(string: "https://tickets.formula1.com/en") {
            UIApplication.shared.open(url)
        }
    }
}
