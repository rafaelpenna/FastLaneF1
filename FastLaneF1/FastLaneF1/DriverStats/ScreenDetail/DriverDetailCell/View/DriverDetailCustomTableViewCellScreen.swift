//
//  DriverDetailCustomTableViewCellScreen.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 21/07/23.
//

import UIKit

class DriverDetailCustomTableViewCellScreen: UIView {
    
    lazy var roundLabel: UILabel = {
        let roundLabel = UILabel()
        roundLabel.translatesAutoresizingMaskIntoConstraints = false
        roundLabel.font = UIFont.boldSystemFont(ofSize: 21)
        roundLabel.textColor = .red
        return roundLabel
    }()
    
    lazy var countryLabel: UILabel = {
        let countryLabel = UILabel()
        countryLabel.translatesAutoresizingMaskIntoConstraints = false
        countryLabel.font = UIFont.boldSystemFont(ofSize: 25)
        countryLabel.textColor = .white
        countryLabel.numberOfLines = 0
        return countryLabel
    }()
    
    lazy var positionTitleLabel: UILabel = {
        let positionTitleLabel = UILabel()
        positionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        positionTitleLabel.font = UIFont.systemFont(ofSize: 21)
        positionTitleLabel.textColor = .white
        positionTitleLabel.text = "Position:"
        return positionTitleLabel
    }()
    
    lazy var positionLabel: UILabel = {
        let positionLabel = UILabel()
        positionLabel.translatesAutoresizingMaskIntoConstraints = false
        positionLabel.font = UIFont.boldSystemFont(ofSize: 22)
        positionLabel.textColor = .white
        return positionLabel
    }()
    
    lazy var pointsLabel: UILabel = {
        let pointsLabel = UILabel()
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
        pointsLabel.font = UIFont.boldSystemFont(ofSize: 24)
        pointsLabel.textColor = .white
        return pointsLabel
    }()
    
    lazy var ptsUnitLabel: UILabel = {
        let pointsUnitsLabel = UILabel()
        pointsUnitsLabel.text = "pts"
        pointsUnitsLabel.translatesAutoresizingMaskIntoConstraints = false
        pointsUnitsLabel.font = UIFont.boldSystemFont(ofSize: 21)
        pointsUnitsLabel.textColor = .white
        return pointsUnitsLabel
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
        addSubview(roundLabel)
        addSubview(countryLabel)
        addSubview(positionTitleLabel)
        addSubview(positionLabel)
        addSubview(pointsLabel)
        addSubview(ptsUnitLabel)
    }
    
    private func configConstraintsInfoDriver(){
        NSLayoutConstraint.activate([
            
            roundLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            roundLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            countryLabel.topAnchor.constraint(equalTo: roundLabel.bottomAnchor, constant: 10),
            countryLabel.leadingAnchor.constraint(equalTo: roundLabel.leadingAnchor),
            countryLabel.widthAnchor.constraint(equalToConstant: 140),
            
            positionTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            positionTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 10),
            
            positionLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            positionLabel.leadingAnchor.constraint(equalTo: positionTitleLabel.trailingAnchor, constant: 4),

            pointsLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            pointsLabel.trailingAnchor.constraint(equalTo: ptsUnitLabel.leadingAnchor, constant: -5),
            
            ptsUnitLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            ptsUnitLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
    }
}

