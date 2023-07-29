//
//  EventScreen.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 18/07/23.
//

import UIKit

class StandingsScreen: UIView {
    
    var standingsViewModel: StandingsViewModel = StandingsViewModel()
    
    lazy var backButton: UIButton = {
       let backButton = UIButton()
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setImage(UIImage(named: "backButton"), for: .normal)
        return backButton
    }()
    
    lazy var circuitCountryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 35)
        return label
    }()
    
    lazy var standingsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Race Standings", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()
    
    lazy var trackButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Track Info", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()
    
    lazy var standingsBoardView: UIStackView = {
        let label = UIStackView()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var standingsHeader: HeaderStandings = {
        let label = HeaderStandings()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var backgroundView: UIView = {
       let background = UIView()
        background.translatesAutoresizingMaskIntoConstraints = false
        background.backgroundColor = .none
        return background
    }()
    
    lazy var eventSoonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "This event will occur soon."
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.isHidden = true
        return label
    }()
    
    lazy var standingsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .darkColorApp
        tableView.register(StandingsTableViewCell.self, forCellReuseIdentifier: StandingsTableViewCell.identifier)
        return tableView
    }()
    
    lazy var trackTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.register(TrackImageCellScreen.self, forCellReuseIdentifier: TrackImageCellScreen.identifier)
        tableView.register(CircuitLenghtCellScreen.self, forCellReuseIdentifier: CircuitLenghtCellScreen.identifier)
        tableView.register(RaceLapsCellScreen.self, forCellReuseIdentifier: RaceLapsCellScreen.identifier)
        tableView.register(FirstGrandPrixCellScreen.self, forCellReuseIdentifier: FirstGrandPrixCellScreen.identifier)
        tableView.register(RaceDistanceCellScreen.self, forCellReuseIdentifier: RaceDistanceCellScreen.identifier)
        tableView.register(TrackRecordCellScreen.self, forCellReuseIdentifier: TrackRecordCellScreen.identifier)
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        backgroundColor()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        standingsTableView.delegate = delegate
        standingsTableView.dataSource = dataSource
        trackTableView.delegate = delegate
        trackTableView.dataSource = dataSource
    }
    
    private func addElements() {
        addSubview(circuitCountryLabel)
        addSubview(trackButton)
        addSubview(standingsButton)
        addSubview(backButton)
        addSubview(standingsBoardView)
        addSubview(eventSoonLabel)
        standingsBoardView.self.addSubview(standingsHeader)
        standingsBoardView.self.addSubview(standingsTableView)
        addSubview(trackTableView)
    }
    
    private func backgroundColor() {
        backgroundColor = .black
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            
            circuitCountryLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            circuitCountryLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            circuitCountryLabel.heightAnchor.constraint(equalToConstant: 35),
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            backButton.heightAnchor.constraint(equalToConstant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 15),
            
            standingsButton.topAnchor.constraint(equalTo: circuitCountryLabel.bottomAnchor, constant: 15),
            standingsButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            standingsButton.heightAnchor.constraint(equalToConstant: 30),
            
            trackButton.topAnchor.constraint(equalTo: circuitCountryLabel.bottomAnchor, constant: 15),
            trackButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            trackButton.heightAnchor.constraint(equalToConstant: 30),
            
            trackTableView.topAnchor.constraint(equalTo: standingsButton.bottomAnchor, constant: 5),
            trackTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            trackTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            trackTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            eventSoonLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            eventSoonLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            eventSoonLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            eventSoonLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            
//MARK: - StandingsBoardView Constraints
         
            standingsBoardView.topAnchor.constraint(equalTo: standingsButton.bottomAnchor, constant: 5),
            standingsBoardView.leadingAnchor.constraint(equalTo: leadingAnchor),
            standingsBoardView.trailingAnchor.constraint(equalTo: trailingAnchor),
            standingsBoardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -90),
                        
            standingsHeader.topAnchor.constraint(equalTo: standingsButton.bottomAnchor, constant: 5),
            standingsHeader.leadingAnchor.constraint(equalTo: leadingAnchor),
            standingsHeader.trailingAnchor.constraint(equalTo: trailingAnchor),
            standingsHeader.heightAnchor.constraint(equalToConstant: 100),

            standingsTableView.topAnchor.constraint(equalTo: standingsHeader.bottomAnchor),
            standingsTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            standingsTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            standingsTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
