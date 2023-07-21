//
//  DriverDetailViewController.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 21/07/23.
//

import UIKit

protocol DriverDetailViewControllerProtocol: AnyObject {
    func passDriverData(data: DriverDetailRace)
}

class DriverDetailViewController: UIViewController {
    
    var driversDetailScreen: DriverDetailScreen?
    let driversDetailViewModel: DriverDetailViewModel = DriverDetailViewModel()
    
    weak private var delegate: DriverDetailViewControllerProtocol?
    public func delegate(delegate: DriverDetailViewControllerProtocol?) {
        self.delegate = delegate
    }

    override func loadView() {
        driversDetailScreen = DriverDetailScreen()
        view = driversDetailScreen
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
        driversDetailViewModel.delegate(delegate: self)
    }
    
    private func loadData() {
        driversDetailViewModel.fetch(.request)
    }
    
    private func addElements() {
        view.addSubview(backButton)
    }
    
    lazy var backButton: UIButton = {
        let button: UIButton = driversDetailScreen?.backButton ?? UIButton()
        button.isSelected = true
        button.addTarget(self, action: #selector(backScreen), for: .touchUpInside)
        return button
    }()
    
    @objc func backScreen() {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - Extension config protocols

extension DriverDetailViewController: UITableViewDelegate, UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return driversDetailViewModel.numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DriverDetailCustomTableViewCell.identifier) as? DriverDetailCustomTableViewCell
        cell?.setupCell(driver: driversDetailViewModel.loadCurrentRound(indexPath: indexPath))
        let backgroundView = UIView()
        backgroundView.backgroundColor = .none
        cell?.selectedBackgroundView = backgroundView
        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

extension DriverDetailViewController: DriverDetailViewModelDelegate {
    func success() {
        driversDetailScreen?.setupTableViewProtocols(delegate: self, dataSource: self)
        reloadTableView()
    }
    func error(_ message: String) {
    }
}

extension DriverDetailViewController: DriverDetailViewModelProtocol {
    func reloadTableView() {
        self.driversDetailScreen?.driversDetailTableView.reloadData()
    }
}
