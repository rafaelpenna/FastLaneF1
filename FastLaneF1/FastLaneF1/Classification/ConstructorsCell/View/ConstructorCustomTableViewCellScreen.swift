//
//  ConstructorCustomTableViewCellScreen.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 19/07/23.
//

import UIKit

class ConstructorCustomTableViewCellScreen: UIView {
    
    lazy var backgroundView: UIImageView = {
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
    
    lazy var teamLabel: UILabel = {
        let teamLabel = UILabel()
        teamLabel.translatesAutoresizingMaskIntoConstraints = false
        teamLabel.font = UIFont.boldSystemFont(ofSize: 22)
        teamLabel.textColor = .white
        return teamLabel
    }()
    
    lazy var pointsLabel: UILabel = {
        let pointsLabel = UILabel()
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
        pointsLabel.font = UIFont.boldSystemFont(ofSize: 22)
        pointsLabel.textColor = .white
        return pointsLabel
    }()
    
    lazy var ptsLabel: UILabel = {
        let pts = UILabel()
        pts.translatesAutoresizingMaskIntoConstraints = false
        pts.text = "pts"
        pts.textColor = .lightGray
        pts.font = UIFont.systemFont(ofSize: 18)
        pts.textColor = .white
        return pts
    }()
    
    lazy var carImage: UIImageView = {
        let carImage = UIImageView()
        carImage.translatesAutoresizingMaskIntoConstraints = false
        carImage.contentMode = .scaleAspectFit
        return carImage
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubViews()
        self.configConstraintsInfoDriver()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubViews(){
        addSubview(backgroundView)
        addSubview(positionLabel)
        addSubview(teamLabel)
        addSubview(pointsLabel)
        addSubview(ptsLabel)
        addSubview(carImage)
    }
    
    
    private func configConstraintsInfoDriver(){
        NSLayoutConstraint.activate([
            
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            positionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            positionLabel.centerXAnchor.constraint(equalTo: leadingAnchor, constant: 40),

            teamLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            teamLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 75),

            pointsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 33),
            pointsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 75),
            pointsLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            ptsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            ptsLabel.leadingAnchor.constraint(equalTo: pointsLabel.trailingAnchor, constant: 5),
            ptsLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            carImage.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 10),
            carImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            carImage.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
}

