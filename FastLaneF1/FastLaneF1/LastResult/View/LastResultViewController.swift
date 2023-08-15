//
//  LastResultViewController.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 02/08/23.
//

import Foundation
import UIKit

protocol LastResultViewControllerProtocol: AnyObject {
    func passLastResultData(data: LastResultRace)
    func passDriverData(data: DriverInfoResult)
}

class LastResultViewController: UIViewController {
    
    var lastResultScreen: LastResultScreen?
    let lastResultViewModel: LastResultViewModel = LastResultViewModel()
    
    weak private var delegate: LastResultViewControllerProtocol?
    public func delegate(delegate: LastResultViewControllerProtocol?) {
        self.delegate = delegate
    }
    
    override func loadView() {
        lastResultScreen = LastResultScreen()
        view = lastResultScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        setupProtocols()
        addElements()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setupProtocols() {
        lastResultViewModel.delegate(delegate: self)
    }
    
    private func loadData() {
        lastResultViewModel.fetchLastResult()
        lastResultViewModel.fetchDriverInfo()
    }
    
    private func addElements() {
        view.addSubview(backButton)
    }
    
    lazy var backButton: UIButton = {
        let button: UIButton = lastResultScreen?.backButton ?? UIButton()
        button.isSelected = true
        button.addTarget(self, action: #selector(backScreen), for: .touchUpInside)
        return button
    }()
    
    @objc func backScreen() {
        navigationController?.popViewController(animated: true)
    }
}

extension LastResultViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lastResultViewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: LastResultCustomTableViewCell.identifier) as? LastResultCustomTableViewCell
            cell?.setupCell(driver: lastResultViewModel.loadCurrentDriver(indexPath: indexPath))
            let backgroundView = UIView()
            backgroundView.backgroundColor = .none
            cell?.selectedBackgroundView = backgroundView
            return cell ?? UITableViewCell()
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
}

extension LastResultViewController: LastResultViewModelDelegate {
    func success() {
        lastResultScreen?.setupTableViewProtocols(delegate: self, dataSource: self)
        lastEventReloadTableView()
    }
    func error(_ message: String) {
    }
}

extension LastResultViewController: LastResultViewModelProtocol {
    func lastEventReloadTableView() {
        DispatchQueue.main.async { [self] in
            lastResultScreen?.photoDriverImageView.image = lastResultViewModel.getWinnerPhoto
            lastResultScreen?.numberVictories.text = lastResultViewModel.getNumberFirstPlace()
            lastResultScreen?.numberSecondPlace.text = lastResultViewModel.getNumberSecondPlace()
            lastResultScreen?.numberThirdPlace.text = lastResultViewModel.getNumberThirdPlace()
            lastResultScreen?.roundEvent.text = "Round \(lastResultViewModel.roundEvent)"
            lastResultScreen?.nameRace.text = lastResultViewModel.circuitCountry
            lastResultScreen?.nameCircuit.text = lastResultViewModel.circuitName
            lastResultScreen?.driversTableView.reloadData()
        }
    }
}
