//
//  DriverDetailScreen.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 21/07/23.
//

import UIKit

class DriverDetailScreen: UIView {
    
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
        label.text = "Season Driver Stats"
        label.font = UIFont.boldSystemFont(ofSize: 35)
        return label
    }()
    
    lazy var backgroundDriverView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        return view
    }()
    
    lazy var driversDetailTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .darkColorApp
        tableView.register(DriverDetailCustomTableViewCell.self, forCellReuseIdentifier: DriverDetailCustomTableViewCell.identifier)
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
        driversDetailTableView.delegate = delegate
        driversDetailTableView.dataSource = dataSource
    }
    
    private func addElements() {
        addSubview(topTitleLabel)
        addSubview(backgroundDriverView)
        addSubview(backButton)
        addSubview(driversDetailTableView)
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
            
            backgroundDriverView.topAnchor.constraint(equalTo: topTitleLabel.bottomAnchor, constant: 25),
            backgroundDriverView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundDriverView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundDriverView.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -10),
            
            driversDetailTableView.topAnchor.constraint(equalTo: backgroundDriverView.bottomAnchor),
            driversDetailTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            driversDetailTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            driversDetailTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

