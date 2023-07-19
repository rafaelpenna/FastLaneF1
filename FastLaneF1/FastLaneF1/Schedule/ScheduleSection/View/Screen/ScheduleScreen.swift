//
//  ScheduleScreen.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 18/07/23.
//

import UIKit

class ScheduleScreen: UIView {
    
    lazy var racesHeaderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Events"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 35)
        return label
    }()

    lazy var infoRacesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .darkColorApp
        tableView.register(ScheduleCustomTableViewCell.self, forCellReuseIdentifier: ScheduleCustomTableViewCell.identifier)
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        setBackgroundColor()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(infoRacesTableView)
        addSubview(racesHeaderLabel)
    }
    
    private func setBackgroundColor() {
        backgroundColor = .black
    }
    
    
    public func setupTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        infoRacesTableView.delegate = delegate
        infoRacesTableView.dataSource = dataSource
    }

    private func configConstraints(){
        NSLayoutConstraint.activate([
            
            racesHeaderLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            racesHeaderLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            infoRacesTableView.topAnchor.constraint(equalTo: racesHeaderLabel.bottomAnchor, constant: 15),
            infoRacesTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            infoRacesTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            infoRacesTableView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            

        ])
    }
}
