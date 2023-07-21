//
//  DriverStatsScreen.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 21/07/23.
//

import UIKit

class DriverStatsScreen: UIView {
    
    lazy var backButton: UIButton = {
       let backButton = UIButton()
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setImage(UIImage(named: "backButton"), for: .normal)
        return backButton
    }()
    
    lazy var topTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "Driver Season Detail"
        label.font = UIFont.boldSystemFont(ofSize: 35)
        return label
    }()
    
    lazy var driversTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .darkColorApp
        tableView.register(DriverStatsCustomTableViewCell.self, forCellReuseIdentifier: DriverStatsCustomTableViewCell.identifier)
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
    }
    
    private func addElements() {
        addSubview(topTitleLabel)
        addSubview(backButton)
        addSubview(driversTableView)
    }
    
    private func backgroundColor() {
        backgroundColor = .black
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            
            topTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            topTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            backButton.heightAnchor.constraint(equalToConstant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 15),
            
            driversTableView.topAnchor.constraint(equalTo: topTitleLabel.bottomAnchor, constant: 25),
            driversTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            driversTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            driversTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
