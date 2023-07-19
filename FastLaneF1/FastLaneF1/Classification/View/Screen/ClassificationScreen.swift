//
//  StandingsScreen.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 19/07/23.
//

import UIKit

class ClassificationScreen: UIView {
    
    lazy var backButton: UIButton = {
       let backButton = UIButton()
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setImage(UIImage(named: "backButton"), for: .normal)
        return backButton
    }()
    
    lazy var topSeasonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "Season Standings"
        label.font = UIFont.boldSystemFont(ofSize: 35)
        return label
    }()
    
    lazy var driversButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Drivers", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()
    
    lazy var constructorButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Constructors", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()
    
    lazy var driversTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .darkColorApp
        tableView.register(DriversCustomTableViewCell.self, forCellReuseIdentifier: DriversCustomTableViewCell.identifier)
        return tableView
    }()
    
    lazy var constructorTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .darkColorApp
        tableView.register(ConstructorTableViewCell.self, forCellReuseIdentifier: ConstructorTableViewCell.identifier)
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
        driversTableView.delegate = delegate
        driversTableView.dataSource = dataSource
        constructorTableView.delegate = delegate
        constructorTableView.dataSource = dataSource
    }
    
    private func addElements() {
        addSubview(topSeasonLabel)
        addSubview(constructorButton)
        addSubview(driversButton)
        addSubview(backButton)
        addSubview(driversTableView)
        addSubview(constructorTableView)
    }
    
    private func backgroundColor() {
        backgroundColor = .black
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            
            topSeasonLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            topSeasonLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            backButton.heightAnchor.constraint(equalToConstant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 15),
            
            driversButton.topAnchor.constraint(equalTo: topSeasonLabel.bottomAnchor, constant: 15),
            driversButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            
            constructorButton.topAnchor.constraint(equalTo: topSeasonLabel.bottomAnchor, constant: 15),
            constructorButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            
            constructorTableView.topAnchor.constraint(equalTo: driversButton.bottomAnchor, constant: 5),
            constructorTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            constructorTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            constructorTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            driversTableView.topAnchor.constraint(equalTo: driversButton.bottomAnchor, constant: 5),
            driversTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            driversTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            driversTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
