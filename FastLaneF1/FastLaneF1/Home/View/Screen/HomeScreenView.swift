//
//  HomeScreen.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 14/07/23.
//

import Foundation
import UIKit

class HomeScreenView: UIView {
    
    var coverHomeScreen: UIImageView = {
        let coverHomeScreen = UIImageView()
        coverHomeScreen.translatesAutoresizingMaskIntoConstraints = false
        coverHomeScreen.image = UIImage(named: "homeCover")
        coverHomeScreen.contentMode = .scaleAspectFill
        return coverHomeScreen
    }()
    
    var logoImage: UIImageView = {
        let logoImage = UIImageView()
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.image = UIImage(named: "logo")
        logoImage.contentMode = .scaleAspectFill
        return logoImage
    }()
    
    lazy var homeTableView: UITableView = {
        let homeTableView = UITableView()
        homeTableView.translatesAutoresizingMaskIntoConstraints = false
        homeTableView.separatorStyle = .none
        homeTableView.backgroundColor = .darkColorApp
        homeTableView.register(UpcomingEventCell.self, forCellReuseIdentifier: UpcomingEventCell.identifier)
        homeTableView.register(LastResultCell.self, forCellReuseIdentifier: LastResultCell.identifier)
        homeTableView.backgroundColor = .black
        return homeTableView
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
    
    private func addElements() {
        addSubview(coverHomeScreen)
        addSubview(homeTableView)
//        addSubview(logoImage)
    }
    
    private func backgroundColor() {
        self.backgroundColor = .darkColorApp
    }
    
    public func setupTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        homeTableView.delegate = delegate
        homeTableView.dataSource = dataSource
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            coverHomeScreen.topAnchor.constraint(equalTo: topAnchor),
            coverHomeScreen.leadingAnchor.constraint(equalTo: leadingAnchor),
            coverHomeScreen.trailingAnchor.constraint(equalTo: trailingAnchor),
            coverHomeScreen.heightAnchor.constraint(equalToConstant: 150),
            
//            logoImage.bottomAnchor.constraint(equalTo: coverHomeScreen.bottomAnchor, constant: 5),
//            logoImage.centerXAnchor.constraint(equalTo: centerXAnchor),
//            logoImage.widthAnchor.constraint(equalToConstant: 80),
//            logoImage.heightAnchor.constraint(equalToConstant: 80),
            
            homeTableView.topAnchor.constraint(equalTo: coverHomeScreen.bottomAnchor, constant: 0),
            homeTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            homeTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            homeTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
