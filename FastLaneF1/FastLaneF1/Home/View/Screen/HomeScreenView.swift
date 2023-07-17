//
//  HomeScreen.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 14/07/23.
//

import Foundation
import UIKit

class HomeScreenView: UIView {
    
    lazy var homeTableView: UITableView = {
        let homeTableView = UITableView()
        homeTableView.translatesAutoresizingMaskIntoConstraints = false
        homeTableView.separatorStyle = .none
        homeTableView.backgroundColor = .darkColorApp
        homeTableView.register(UpcomingEventCell.self, forCellReuseIdentifier: UpcomingEventCell.identifier)
        homeTableView.register(LatestResultCell.self, forCellReuseIdentifier: LatestResultCell.identifier)
        homeTableView.register(ChampionshipStandingsCell.self, forCellReuseIdentifier: ChampionshipStandingsCell.identifier)
        homeTableView.register(ScheduleCell.self, forCellReuseIdentifier: ScheduleCell.identifier)
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
        addSubview(homeTableView)
    }
    
    private func backgroundColor() {
        self.backgroundColor = .darkColorApp
    }
    
    public func setupTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        self.homeTableView.delegate = delegate
        self.homeTableView.dataSource = dataSource
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            homeTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            homeTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            homeTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            homeTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
}
