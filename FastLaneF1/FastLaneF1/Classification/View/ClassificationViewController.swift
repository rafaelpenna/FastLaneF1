//
//  ClassificationViewController.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 19/07/23.
//

import UIKit

protocol DriversViewControllerProtocol: AnyObject {
    func passDriverData(data: DriverStandingDriversModel)
}

class ClassificationViewController: UIViewController {
    
    var driversScreen: ClassificationScreen?
    let driversViewModel: ClassificationDriverViewModel = ClassificationDriverViewModel()
    let constructorViewModel: ClassificationConstructorViewModel = ClassificationConstructorViewModel()
    
    weak private var delegate: DriversViewControllerProtocol?
    public func delegate(delegate: DriversViewControllerProtocol?) {
        self.delegate = delegate
    }

    override func loadView() {
        driversScreen = ClassificationScreen()
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
        driversViewModel.delegate(delegate: self)
        constructorViewModel.delegate(delegate: self)
    }
    
    private func loadData() {
        driversViewModel.fetch(.request)
        constructorViewModel.fetchTeams(.request)
    }
    
    private func addElements() {
        view.addSubview(backButton)
        buttonStandingsConstrcutor(constructorsButton)
        buttonStandingsDrivers(driversButton)
    }
    
    lazy var backButton: UIButton = {
        let button: UIButton = driversScreen?.backButton ?? UIButton()
        button.isSelected = true
        button.addTarget(self, action: #selector(backScreen), for: .touchUpInside)
        return button
    }()
    
    
    lazy var driversButton: UIButton = {
        let button: UIButton = driversScreen?.driversButton ?? UIButton()
        button.isSelected = true
        button.addTarget(self, action: #selector(self.buttonStandingsDrivers(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var constructorsButton: UIButton = {
        let button: UIButton = driversScreen?.constructorButton ?? UIButton()
        button.isSelected = false
        button.addTarget(self, action: #selector(self.buttonStandingsConstrcutor(_:)), for: .touchUpInside)
        return button
    }()
    
    @objc func buttonStandingsDrivers(_ sender: UIButton) {
        if driversButton.isSelected == false {
            buttonDriversSelected()
        } else {
            buttonDriversSelected()
        }
    }
    
    @objc func buttonStandingsConstrcutor(_ sender: UIButton) {
        if constructorsButton.isSelected == false {
            buttonConstructorSelected()
        } else {
            buttonConstructorSelected()
        }
    }
        
        private func buttonDriversSelected() {
            driversButton.isSelected = true
            constructorsButton.isSelected = false
            driversScreen?.constructorTableView.isHidden = true
            driversScreen?.driversTableView.reloadData()
            driversScreen?.driversButton.setTitleColor(UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1), for: .normal)
            driversScreen?.constructorButton.setTitleColor(UIColor(red: 66/255, green: 66/255, blue: 66/255, alpha: 1), for: .normal)
        }
        
        private func buttonConstructorSelected() {
            constructorsButton.isSelected = true
            driversButton.isSelected = false
            driversScreen?.constructorTableView.isHidden = false
            driversScreen?.constructorButton.setTitleColor(UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1), for: .normal)
            driversScreen?.driversButton.setTitleColor(UIColor(red: 66/255, green: 66/255, blue: 66/255, alpha: 1), for: .normal)
        }
    
    @objc func backScreen() {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - Extension config protocols

extension ClassificationViewController: UITableViewDelegate, UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == driversScreen?.driversTableView {
            return driversViewModel.numberOfRows
        } else {
            return constructorViewModel.numberOfRowsTeams
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == driversScreen?.driversTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: DriversCustomTableViewCell.identifier) as? DriversCustomTableViewCell
            cell?.setupCell(driver: driversViewModel.loadCurrentDriver(indexPath: indexPath))
            let backgroundView = UIView()
            backgroundView.backgroundColor = .none
            cell?.selectedBackgroundView = backgroundView
            return cell ?? UITableViewCell()
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ConstructorTableViewCell.identifier) as? ConstructorTableViewCell
            cell?.setupCell(teamData: constructorViewModel.loadCurrentTeam(indexPath: indexPath))
            let backgroundView = UIView()
            backgroundView.backgroundColor = .none
            cell?.selectedBackgroundView = backgroundView
            return cell ?? UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == driversScreen?.driversTableView {
            return 85
        } else {
            return 120
        }
    }
}

extension ClassificationViewController: DriversViewModelDelegate, ConstructorViewModelDelegate {
    func success() {
        driversScreen?.setupTableViewProtocols(delegate: self, dataSource: self)
        reloadTableView()
    }
    func error(_ message: String) {
    }
}

extension ClassificationViewController: DriversViewModelProtocol {
    func reloadTableView() {
        self.driversScreen?.driversTableView.reloadData()
        self.driversScreen?.constructorTableView.reloadData()
    }
}
