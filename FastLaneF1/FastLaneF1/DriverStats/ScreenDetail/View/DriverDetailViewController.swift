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
    var selectedDriver: String = ""
    var givenNameDriver: String = ""
    var lastNameDriver: String = ""
    
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
        driversDetailViewModel.selectedDriver = selectedDriver
        driversDetailViewModel.fetch(.request)
    }
    
    private func addElements() {
        view.addSubview(backButton)
        view.addSubview(backgroundImage)
        view.addSubview(givenNameLabel)
        view.addSubview(familyNameLabel)
        view.addSubview(driverImageView)
    }
    
    lazy var backButton: UIButton = {
        let button: UIButton = driversDetailScreen?.backButton ?? UIButton()
        button.isSelected = true
        button.addTarget(self, action: #selector(backScreen), for: .touchUpInside)
        return button
    }()
    
    lazy var givenNameLabel: UILabel = {
        let label: UILabel = driversDetailScreen?.nameLabel ?? UILabel()
        label.text = givenNameDriver
        return label
    }()

    lazy var familyNameLabel: UILabel = {
        let label: UILabel = driversDetailScreen?.lastNameLabel ?? UILabel()
        label.text = lastNameDriver
        return label
    }()

    lazy var driverImageView: UIImageView = {
        let image: UIImageView = driversDetailScreen?.photoDriverImageView ?? UIImageView()
        image.image = getDriversPhoto
        return image
    }()
    
    lazy var backgroundImage: UIImageView = {
        let backgroundImage: UIImageView = driversDetailScreen?.backgroundDriverView ?? UIImageView()
        backgroundImage.image = getTeamsBackground
        return backgroundImage
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

extension DriverDetailViewController {
    
    public var getDriversPhoto: UIImage {
        if familyNameLabel.text == "Verstappen" {
            return UIImage(named: "max") ?? UIImage()
        } else if familyNameLabel.text == "Pérez" {
            return UIImage(named: "sergio") ?? UIImage()
        } else if familyNameLabel.text == "Stroll" {
            return UIImage(named: "lance") ?? UIImage()
        } else if familyNameLabel.text == "Sainz" {
            return UIImage(named: "carlos") ?? UIImage()
        } else if familyNameLabel.text == "Russell" {
            return UIImage(named: "george") ?? UIImage()
        } else if familyNameLabel.text == "Hamilton" {
            return UIImage(named: "lewis") ?? UIImage()
        } else if familyNameLabel.text == "Alonso" {
            return UIImage(named: "fernando") ?? UIImage()
        } else if familyNameLabel.text == "Ocon" {
            return UIImage(named: "esteban") ?? UIImage()
        } else if familyNameLabel.text == "Gasly" {
            return UIImage(named: "pierre") ?? UIImage()
        } else if familyNameLabel.text == "Norris" {
            return UIImage(named: "lando") ?? UIImage()
        } else if familyNameLabel.text == "Hülkenberg" {
            return UIImage(named: "nico") ?? UIImage()
        } else if familyNameLabel.text == "Piastri" {
            return UIImage(named: "oscar") ?? UIImage()
        } else if familyNameLabel.text == "Bottas" {
            return UIImage(named: "valteri") ?? UIImage()
        } else if familyNameLabel.text == "Zhou" {
            return UIImage(named: "guanyu") ?? UIImage()
        } else if familyNameLabel.text == "Tsunoda" {
            return UIImage(named: "yuki") ?? UIImage()
        } else if familyNameLabel.text == "Magnussen" {
            return UIImage(named: "kevin") ?? UIImage()
        } else if familyNameLabel.text == "Albon" {
            return UIImage(named: "alexander") ?? UIImage()
        } else if familyNameLabel.text == "de Vries" {
            return UIImage(named: "nyck") ?? UIImage()
        } else if familyNameLabel.text == "Sargeant" {
            return UIImage(named: "logan") ?? UIImage()
        } else if familyNameLabel.text == "Leclerc" {
            return UIImage(named: "charles") ?? UIImage()
        }
        return UIImage()
    }
    
    public var getTeamsBackground: UIImage {
        if  familyNameLabel.text == "Verstappen" || familyNameLabel.text == "Pérez" {
            return UIImage(named: "redbullbackground") ?? UIImage()
        } else if familyNameLabel.text == "Hamilton" || familyNameLabel.text == "Russell" {
            return UIImage(named: "mercedesbackground") ?? UIImage()
        } else if familyNameLabel.text == "Alonso" || familyNameLabel.text == "Stroll" {
            return UIImage(named: "astonmartinbackground") ?? UIImage()
        } else if familyNameLabel.text == "Sainz" || familyNameLabel.text == "Leclerc" {
            return UIImage(named: "ferraribackground") ?? UIImage()
        } else if familyNameLabel.text == "Norris" || familyNameLabel.text == "Piastri" {
            return UIImage(named: "mclarenbackground") ?? UIImage()
        } else if familyNameLabel.text == "Ocon" || familyNameLabel.text == "Gasly" {
            return UIImage(named: "alpinebackground") ?? UIImage()
        } else if familyNameLabel.text == "Magnussen" || familyNameLabel.text == "Hülkenberg" {
            return UIImage(named: "haasbackground") ?? UIImage()
        } else if familyNameLabel.text == "Albon" || familyNameLabel.text == "Sargeant" {
            return UIImage(named: "williamsbackground") ?? UIImage()
        } else if familyNameLabel.text == "de Vries" || familyNameLabel.text == "Tsunoda" || familyNameLabel.text == "Ricciardo" {
            return UIImage(named: "alphatauribackground") ?? UIImage()
        } else if familyNameLabel.text == "Bottas" || familyNameLabel.text == "Zhou" {
            return UIImage(named: "alfaromeobackground") ?? UIImage()
        }
        return UIImage()
    }
    
}
