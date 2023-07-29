//
//  EventViewController.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 18/07/23.
//

import UIKit

enum StandingsTableViewSection: Int {
    case trackImage
    case circuitLenght
    case raceLaps
    case firstGrandPrix
    case raceDistance
    case trackRecord
}

class StandingsViewController: UIViewController {
    
    var standingsScreen: StandingsScreen?
    var standingsViewModel: StandingsViewModel = StandingsViewModel()
    var selectedRound: Int = 0
    var circuitCountryNameLabel: String = ""
    
    override func loadView() {
        standingsScreen = StandingsScreen()
        view = standingsScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addElements()
        setupProtocols()
        loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    private func loadData() {
        passingHeaderData()
        standingsViewModel.selectedRound = selectedRound
        standingsViewModel.fetchStandings(.request)
        standingsViewModel.fetchCircuit()
    }
    
    private func addElements() {
        view.addSubview(backButton)
        buttonCircuit(circuitDataButton)
        buttonStandings(standingsDataButton)
    }
    
    private func setupProtocols() {
        standingsViewModel.delegate(delegate: self)
    }
    
    private func bestLapData() {
        self.standoutName.text = standingsViewModel.bestLapDataName
        self.standoutLap.text = standingsViewModel.bestLapDataTime
    }
    
    private func passingHeaderData() {
        standingsScreen?.circuitCountryLabel.text = circuitCountryNameLabel
    }
    
    lazy var standingsDataButton: UIButton = {
        let button: UIButton = standingsScreen?.standingsButton ?? UIButton()
        button.isSelected = true
        button.addTarget(self, action: #selector(self.buttonStandings(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var circuitDataButton: UIButton = {
        let button: UIButton = standingsScreen?.trackButton ?? UIButton()
        button.isSelected = false
        button.addTarget(self, action: #selector(self.buttonCircuit(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var backButton: UIButton = {
        let button: UIButton = standingsScreen?.backButton ?? UIButton()
        button.isSelected = true
        button.addTarget(self, action: #selector(backScreen), for: .touchUpInside)
        return button
    }()
    
    lazy var standoutName: UILabel = {
        let label: UILabel = standingsScreen?.standingsHeader.standoutNameLabel ?? UILabel()
        return label
    }()
    
    lazy var standoutLap: UILabel = {
        let label: UILabel = standingsScreen?.standingsHeader.standoutTimeLabel ?? UILabel()
        return label
    }()
    
    
    @objc func buttonStandings(_ sender: UIButton) {
        if standingsDataButton.isSelected == false {
            buttonStandingsSelected()
        } else {
            buttonStandingsSelected()
        }
    }
    
    @objc func buttonCircuit(_ sender: UIButton) {
        if circuitDataButton.isSelected == false {
            buttonCircuitSelected()
        } else {
            buttonCircuitSelected()
        }
    }
        
        private func buttonStandingsSelected() {
            standingsDataButton.isSelected = true
            circuitDataButton.isSelected = false
            standingsScreen?.standingsBoardView.isHidden = false
            standingsScreen?.trackTableView.isHidden = true
            standingsScreen?.standingsTableView.reloadData()
            standingsScreen?.standingsButton.setTitleColor(UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1), for: .normal)
            standingsScreen?.trackButton.setTitleColor(UIColor(red: 66/255, green: 66/255, blue: 66/255, alpha: 1), for: .normal)
        }
        
        private func buttonCircuitSelected() {
            circuitDataButton.isSelected = true
            standingsDataButton.isSelected = false
            standingsScreen?.standingsBoardView.isHidden = true
            standingsScreen?.trackTableView.isHidden = false
            standingsScreen?.trackButton.setTitleColor(UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1), for: .normal)
            standingsScreen?.standingsButton.setTitleColor(UIColor(red: 66/255, green: 66/255, blue: 66/255, alpha: 1), for: .normal)
        }
    
    @objc func backScreen() {
        navigationController?.popViewController(animated: true)
    }
}


//MARK: - Extension config protocols

extension StandingsViewController: UITableViewDelegate, UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == standingsScreen?.standingsTableView {
            if standingsViewModel.numberOfRowsResults != 0 {
                standingsScreen?.eventSoonLabel.isHidden = true
                return (standingsViewModel.numberOfRowsResults)
            } else {
                standingsScreen?.eventSoonLabel.isHidden = false
                return 0
            }
        } else {
            return 6
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == standingsScreen?.trackTableView {
            switch StandingsTableViewSection(rawValue: indexPath.row){
            case .trackImage:
                let cell = tableView.dequeueReusableCell(withIdentifier: TrackImageCellScreen.identifier) as? TrackImageCellScreen
                cell?.configure()
                cell?.trackImage.image = UIImage(named: "\(standingsViewModel.circuitImage)")
                cell?.selectedBackgroundView = standingsScreen?.backgroundView
                return cell ?? UITableViewCell()
            case .circuitLenght:
                let cell = tableView.dequeueReusableCell(withIdentifier: CircuitLenghtCellScreen.identifier) as? CircuitLenghtCellScreen
                cell?.configure()
                cell?.trackLenghtAnswer.text = standingsViewModel.circuitLength
                cell?.selectedBackgroundView = standingsScreen?.backgroundView
                return cell ?? UITableViewCell()
            case .raceLaps:
                let cell = tableView.dequeueReusableCell(withIdentifier: RaceLapsCellScreen.identifier) as? RaceLapsCellScreen
                cell?.configure()
                cell?.trackLapsAnswer.text = standingsViewModel.circuitNumberOfLaps
                cell?.selectedBackgroundView = standingsScreen?.backgroundView
                return cell ?? UITableViewCell()
            case .firstGrandPrix:
                let cell = tableView.dequeueReusableCell(withIdentifier: FirstGrandPrixCellScreen.identifier) as? FirstGrandPrixCellScreen
                cell?.configure()
                cell?.firstGrandPrixAnswer.text = standingsViewModel.firstGP
                cell?.selectedBackgroundView = standingsScreen?.backgroundView
                return cell ?? UITableViewCell()
            case .raceDistance:
                let cell = tableView.dequeueReusableCell(withIdentifier: RaceDistanceCellScreen.identifier) as? RaceDistanceCellScreen
                cell?.configure()
                cell?.raceDistanceAnswer.text = standingsViewModel.raceDistance
                cell?.selectedBackgroundView = standingsScreen?.backgroundView
                return cell ?? UITableViewCell()
            case .trackRecord:
                let cell = tableView.dequeueReusableCell(withIdentifier: TrackRecordCellScreen.identifier) as? TrackRecordCellScreen
                cell?.configure()
                cell?.trackRecordAnswer.text = standingsViewModel.circuitRecordTime
                cell?.trackRecordOwner.text = standingsViewModel.circuitRecordName
                cell?.trackRecordYear.text = "(\(standingsViewModel.circuitRecordYear))"
                cell?.selectedBackgroundView = standingsScreen?.backgroundView
                return cell ?? UITableViewCell()
            default:
                return UITableViewCell()
            }
        } else {
            let cell: StandingsTableViewCell? = tableView.dequeueReusableCell(withIdentifier: StandingsTableViewCell.identifier) as? StandingsTableViewCell
            cell?.setupCell(data: standingsViewModel.loadCurrentDriver(indexPath: indexPath))
            bestLapData()
            cell?.selectedBackgroundView = standingsScreen?.backgroundView
            return cell ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == standingsScreen?.standingsTableView {
            return 45
        } else {
            if indexPath.row == 0 {
                return 350
            } else {
                return 110
            }
        }
    }
}

extension StandingsViewController: StandingsViewModelDelegate {
    func success() {
        standingsScreen?.setupTableViewProtocols(delegate: self, dataSource: self)
        reloadTableView()
    }
    
    func error(_ message: String) {
    }
}

extension StandingsViewController: StandingsViewModelProtocol {
    func reloadTableView() {
        DispatchQueue.main.async {
            self.standingsScreen?.standingsTableView.reloadData()
            self.standingsScreen?.trackTableView.reloadData()
        }
    }
}
