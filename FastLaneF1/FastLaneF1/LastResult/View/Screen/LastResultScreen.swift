//
//  LastResultScreen.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 02/08/23.
//

import Foundation
import UIKit

class LastResultScreen: UIView {
    
    lazy var backButton: UIButton = {
       let backButton = UIButton()
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setImage(UIImage(systemName: "arrowshape.turn.up.backward"), for: .normal)
        backButton.tintColor = .white
        return backButton
    }()
    
    lazy var topSeasonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "Last Result"
        label.font = UIFont.boldSystemFont(ofSize: 35)
        return label
    }()
    
    lazy var lastEventBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    lazy var roundEvent: UILabel = {
        let pointsLabel = UILabel()
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
        pointsLabel.font = UIFont.boldSystemFont(ofSize: 20)
        pointsLabel.textColor = .red
        return pointsLabel
    }()
    
    lazy var nameRace: UILabel = {
        let pointsLabel = UILabel()
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
        pointsLabel.font = UIFont.boldSystemFont(ofSize: 18)
        pointsLabel.textColor = .white
        return pointsLabel
    }()
    
    lazy var nameCircuit: UILabel = {
        let pointsLabel = UILabel()
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
        pointsLabel.font = UIFont.boldSystemFont(ofSize: 16)
        pointsLabel.textColor = .white
        return pointsLabel
    }()
    
    lazy var driversTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .black
        tableView.register(LastResultCustomTableViewCell.self, forCellReuseIdentifier: LastResultCustomTableViewCell.identifier)
        return tableView
    }()
    
    lazy var photoDriverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var medalFirstPlace: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "1st")
        return imageView
    }()
    
    lazy var numberVictories: UILabel = {
        let pointsLabel = UILabel()
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
        pointsLabel.font = UIFont.boldSystemFont(ofSize: 21)
        pointsLabel.textColor = .white
        pointsLabel.text = "1"
        return pointsLabel
    }()
    
    lazy var medalSecondPlace: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "2nd")
        return imageView
    }()
    
    lazy var numberSecondPlace: UILabel = {
        let pointsLabel = UILabel()
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
        pointsLabel.font = UIFont.boldSystemFont(ofSize: 21)
        pointsLabel.textColor = .white
        pointsLabel.text = "2"
        return pointsLabel
    }()
    
    lazy var medalThirdPlace: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "3rd")
        return imageView
    }()
    
    lazy var numberThirdPlace: UILabel = {
        let pointsLabel = UILabel()
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
        pointsLabel.font = UIFont.boldSystemFont(ofSize: 21)
        pointsLabel.textColor = .white
        pointsLabel.text = "3"
        return pointsLabel
    }()
    
    lazy var winnerBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkColorApp
        return view
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
        addSubview(topSeasonLabel)
        addSubview(driversTableView)
        addSubview(winnerBackground)
        addSubview(backButton)
        addSubview(lastEventBackground)
        addSubview(roundEvent)
        addSubview(nameRace)
        addSubview(nameCircuit)
        addSubview(photoDriverImageView)
        addSubview(medalFirstPlace)
        addSubview(medalSecondPlace)
        addSubview(medalThirdPlace)
        addSubview(numberVictories)
        addSubview(numberSecondPlace)
        addSubview(numberThirdPlace)
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
            backButton.heightAnchor.constraint(equalToConstant: 40),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            
            driversTableView.topAnchor.constraint(equalTo: lastEventBackground.bottomAnchor),
            driversTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            driversTableView.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -10),
            driversTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            lastEventBackground.topAnchor.constraint(equalTo: topSeasonLabel.bottomAnchor, constant: 25),
            lastEventBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            lastEventBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            lastEventBackground.heightAnchor.constraint(equalToConstant: 100),
            
            roundEvent.bottomAnchor.constraint(equalTo: nameRace.topAnchor, constant: -5),
            roundEvent.leadingAnchor.constraint(equalTo: lastEventBackground.leadingAnchor, constant: 15),
            
            nameRace.centerYAnchor.constraint(equalTo: lastEventBackground.centerYAnchor),
            nameRace.leadingAnchor.constraint(equalTo: lastEventBackground.leadingAnchor, constant: 15),
            
            nameCircuit.topAnchor.constraint(equalTo: nameRace.bottomAnchor, constant: 5),
            nameCircuit.leadingAnchor.constraint(equalTo: lastEventBackground.leadingAnchor, constant: 15),

            winnerBackground.topAnchor.constraint(equalTo: lastEventBackground.bottomAnchor),
            winnerBackground.leadingAnchor.constraint(equalTo: driversTableView.trailingAnchor),
            winnerBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            winnerBackground.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            photoDriverImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -60),
            photoDriverImageView.centerXAnchor.constraint(equalTo: winnerBackground.centerXAnchor, constant: 10),
            photoDriverImageView.heightAnchor.constraint(equalToConstant: 175),
            photoDriverImageView.widthAnchor.constraint(equalToConstant: 175),
            
            medalFirstPlace.centerXAnchor.constraint(equalTo: photoDriverImageView.centerXAnchor, constant: -20),
            medalFirstPlace.topAnchor.constraint(equalTo: photoDriverImageView.bottomAnchor, constant: 15),
            medalFirstPlace.heightAnchor.constraint(equalToConstant: 50),
            medalFirstPlace.widthAnchor.constraint(equalToConstant: 50),
            
            medalSecondPlace.centerXAnchor.constraint(equalTo: medalFirstPlace.centerXAnchor, constant: -3),
            medalSecondPlace.topAnchor.constraint(equalTo: medalFirstPlace.bottomAnchor, constant: 10),
            medalSecondPlace.heightAnchor.constraint(equalToConstant: 50),
            medalSecondPlace.widthAnchor.constraint(equalToConstant: 50),
            
            medalThirdPlace.centerXAnchor.constraint(equalTo: medalSecondPlace.centerXAnchor, constant: 3),
            medalThirdPlace.topAnchor.constraint(equalTo: medalSecondPlace.bottomAnchor, constant: 10),
            medalThirdPlace.heightAnchor.constraint(equalToConstant: 50),
            medalThirdPlace.widthAnchor.constraint(equalToConstant: 50),
            
            numberVictories.centerYAnchor.constraint(equalTo: medalFirstPlace.centerYAnchor),
            numberVictories.centerXAnchor.constraint(equalTo: photoDriverImageView.centerXAnchor, constant: 20),
            
            numberSecondPlace.centerYAnchor.constraint(equalTo: medalSecondPlace.centerYAnchor),
            numberSecondPlace.centerXAnchor.constraint(equalTo: photoDriverImageView.centerXAnchor, constant: 20),
            
            numberThirdPlace.centerYAnchor.constraint(equalTo: medalThirdPlace.centerYAnchor),
            numberThirdPlace.centerXAnchor.constraint(equalTo: photoDriverImageView.centerXAnchor, constant: 20),
        ])
    }
}
