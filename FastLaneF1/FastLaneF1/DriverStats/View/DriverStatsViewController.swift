//
//  DriverStatsViewController.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 21/07/23.
//

import UIKit

protocol DriverStatsViewControllerProtocol: AnyObject {
    func passDriverData(data: DriverStandingDriversModel)
}

class DriverStatsViewController: UIViewController {
    
    var driversScreen: DriverStatsScreen?
    let driversStatsViewModel: DriverStatsViewModel = DriverStatsViewModel()
    
    weak private var delegate: DriverStatsViewControllerProtocol?
    public func delegate(delegate: DriverStatsViewControllerProtocol?) {
        self.delegate = delegate
    }

    override func loadView() {
        driversScreen = DriverStatsScreen()
        view = driversScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupProtocols()
        loadData()
        addElements()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setupProtocols() {
        driversStatsViewModel.delegate(delegate: self)
    }
    
    private func loadData() {
        driversStatsViewModel.fetch(.request)
    }
    
    private func addElements() {
        view.addSubview(backButton)
    }
    
    lazy var backButton: UIButton = {
        let button: UIButton = driversScreen?.backButton ?? UIButton()
        button.isSelected = true
        button.addTarget(self, action: #selector(backScreen), for: .touchUpInside)
        return button
    }()
    
    @objc func backScreen() {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - Extension config protocols

extension DriverStatsViewController: UITableViewDelegate, UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return driversStatsViewModel.numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DriverStatsCustomTableViewCell.identifier) as? DriverStatsCustomTableViewCell
        cell?.setupCell(driver: driversStatsViewModel.loadCurrentDriver(indexPath: indexPath))
        let backgroundView = UIView()
        backgroundView.backgroundColor = .none
        cell?.selectedBackgroundView = backgroundView
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DriverDetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

extension DriverStatsViewController: DriverStatsViewModelDelegate {
    func success() {
        driversScreen?.setupTableViewProtocols(delegate: self, dataSource: self)
        reloadTableView()
    }
    func error(_ message: String) {
    }
}

extension DriverStatsViewController: DriverStatsViewModelProtocol {
    func reloadTableView() {
        self.driversScreen?.driversTableView.reloadData()
    }
}
