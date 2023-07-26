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
    
    lazy var backgroundDriverView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var photoDriverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let firstNameLabel = UILabel()
        firstNameLabel.translatesAutoresizingMaskIntoConstraints = false
        firstNameLabel.font = UIFont.systemFont(ofSize: 24)
        firstNameLabel.textColor = .white
        return firstNameLabel
    }()
    
    lazy var lastNameLabel: UILabel = {
        let lastNameLabel = UILabel()
        lastNameLabel.translatesAutoresizingMaskIntoConstraints = false
        lastNameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        lastNameLabel.textColor = .white
        return lastNameLabel
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
        addSubview(photoDriverImageView)
        addSubview(nameLabel)
        addSubview(lastNameLabel)
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
            
            lastNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            lastNameLabel.bottomAnchor.constraint(equalTo: backgroundDriverView.bottomAnchor, constant: -10),
            
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: lastNameLabel.topAnchor, constant: -5),
            
            photoDriverImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            photoDriverImageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor),
            photoDriverImageView.widthAnchor.constraint(equalToConstant: 175),
            photoDriverImageView.heightAnchor.constraint(equalToConstant: 175),
            
            driversDetailTableView.topAnchor.constraint(equalTo: backgroundDriverView.bottomAnchor),
            driversDetailTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            driversDetailTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            driversDetailTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

