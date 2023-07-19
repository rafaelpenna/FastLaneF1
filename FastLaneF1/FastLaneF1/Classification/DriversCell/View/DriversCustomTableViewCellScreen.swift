//
//  DriversCustomTableViewCell.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 19/07/23.
//

import UIKit

class DriversCustomTableViewCellScreen: UIView {
    
    lazy var positionLabel: UILabel = {
        let positionLabel = UILabel()
        positionLabel.translatesAutoresizingMaskIntoConstraints = false
        positionLabel.font = UIFont.boldSystemFont(ofSize: 27)
        positionLabel.textColor = .white
        return positionLabel
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
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 21)
        nameLabel.textColor = .white
        return nameLabel
    }()
    
    lazy var lastNameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.boldSystemFont(ofSize: 21)
        nameLabel.textColor = .white
        return nameLabel
    }()
    
    lazy var teamLabel: UILabel = {
        let teamLabel = UILabel()
        teamLabel.translatesAutoresizingMaskIntoConstraints = false
        teamLabel.font = UIFont.systemFont(ofSize: 18)
        teamLabel.textColor = .white
        return teamLabel
    }()
    
    lazy var pointsLabel: UILabel = {
        let pointsLabel = UILabel()
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
        pointsLabel.font = UIFont.boldSystemFont(ofSize: 21)
        pointsLabel.textColor = .white
        return pointsLabel
    }()
    
    lazy var pointsUnitLabel: UILabel = {
        let pts = UILabel()
        pts.translatesAutoresizingMaskIntoConstraints = false
        pts.text = "pts"
        pts.font = UIFont.systemFont(ofSize: 16)
        pts.textColor = .white
        return pts
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addElements()
        self.configConstraintsInfoDriver()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements(){
        addSubview(positionLabel)
        addSubview(photoDriverImageView)
        addSubview(nameLabel)
        addSubview(lastNameLabel)
        addSubview(teamLabel)
        addSubview(pointsLabel)
        addSubview(pointsUnitLabel)
    }
    
    private func configConstraintsInfoDriver(){
        NSLayoutConstraint.activate([
            
            positionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            positionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),

            photoDriverImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            photoDriverImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            photoDriverImageView.heightAnchor.constraint(equalToConstant: 50),
            photoDriverImageView.widthAnchor.constraint(equalToConstant: 50),

            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 110),
            
            lastNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            lastNameLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 5),
            
            teamLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 1),
            teamLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),

            pointsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 23),
            pointsLabel.trailingAnchor.constraint(equalTo: pointsUnitLabel.leadingAnchor, constant: -5),
            pointsLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            pointsUnitLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            pointsUnitLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            pointsUnitLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}

