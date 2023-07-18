//
//  ScheduleScreen.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 18/07/23.
//

import UIKit

class ScheduleScreen: UIView {

    lazy var infoRacesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1)
        tableView.register(ScheduleCustomTableViewCell.self, forCellReuseIdentifier: ScheduleCustomTableViewCell.identifier)
        return tableView
    }()
    
    lazy var safeAreaBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    lazy var backgroundTopView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    lazy var racesHeaderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Etapas"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 35)
        return label
    }()
    
    lazy var seasonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "TEMPORADA 2023"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    lazy var driversDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Confira os resultados e informações de todas as etapas da temporada:"
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
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
        addSubview(safeAreaBackgroundView)
        addSubview(backgroundTopView)
        addSubview(racesHeaderLabel)
        addSubview(seasonLabel)
        addSubview(driversDescriptionLabel)
    }
    
    private func setBackgroundColor() {
        backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1)
    }
    
    
    public func setupTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        infoRacesTableView.delegate = delegate
        infoRacesTableView.dataSource = dataSource
    }

    private func configConstraints(){
        NSLayoutConstraint.activate([
            
            safeAreaBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            safeAreaBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            safeAreaBackgroundView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            safeAreaBackgroundView.heightAnchor.constraint(equalToConstant: 135),
            
            backgroundTopView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundTopView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundTopView.topAnchor.constraint(equalTo: topAnchor),
            backgroundTopView.heightAnchor.constraint(equalToConstant: 80),
            
            infoRacesTableView.topAnchor.constraint(equalTo: safeAreaBackgroundView.bottomAnchor),
            infoRacesTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            infoRacesTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            infoRacesTableView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            
            racesHeaderLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            racesHeaderLabel.centerXAnchor.constraint(equalTo: safeAreaBackgroundView.centerXAnchor),
            
            seasonLabel.bottomAnchor.constraint(equalTo: driversDescriptionLabel.topAnchor, constant: -4),
            seasonLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            driversDescriptionLabel.bottomAnchor.constraint(equalTo: safeAreaBackgroundView.bottomAnchor, constant: -8),
            driversDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            driversDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
    }
}
