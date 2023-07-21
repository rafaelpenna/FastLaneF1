//
//  DriverStatsCustomTableViewCellScreen.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 21/07/23.
//

import UIKit

class DriverStatsCustomTableViewCellScreen: UIView {
    
    lazy var teamBackground: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    lazy var positionLabel: UILabel = {
        let positionLabel = UILabel()
        positionLabel.translatesAutoresizingMaskIntoConstraints = false
        positionLabel.font = UIFont.boldSystemFont(ofSize: 35)
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
    
    lazy var carImage: UIImageView = {
        let carImage = UIImageView()
        carImage.translatesAutoresizingMaskIntoConstraints = false
        carImage.contentMode = .scaleAspectFit
        return carImage
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
        addSubview(teamBackground)
        addSubview(positionLabel)
        addSubview(photoDriverImageView)
        addSubview(nameLabel)
        addSubview(lastNameLabel)
        addSubview(carImage)
    }
    
    private func configConstraintsInfoDriver(){
        NSLayoutConstraint.activate([
            
            teamBackground.topAnchor.constraint(equalTo: topAnchor),
            teamBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            teamBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            teamBackground.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            positionLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            positionLabel.centerXAnchor.constraint(equalTo: leadingAnchor, constant: 35),

            photoDriverImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            photoDriverImageView.leadingAnchor.constraint(equalTo: positionLabel.trailingAnchor, constant: 5),
            photoDriverImageView.heightAnchor.constraint(equalToConstant: 120),
            photoDriverImageView.widthAnchor.constraint(equalToConstant: 120),

            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: photoDriverImageView.trailingAnchor, constant: 40),
            
            lastNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            lastNameLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 5),
            
            carImage.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 20),
            carImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            carImage.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
}

