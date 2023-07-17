//
//  ChampionshipStandingsCell.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 17/07/23.
//

import UIKit

class ChampionshipStandingsCell: UITableViewCell {

    static let identifier = String(describing: ChampionshipStandingsCell.self)
    
    var championshipLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Championship Standings"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.layer.backgroundColor = UIColor.darkGray.cgColor
        return label
    }()
    
    public func configure() {
        addSubviews()
        configConstraintsUpcomingEvent()
        backgroundColor()
    }
    
    private func addSubviews() {
        addSubview(championshipLabel)
    }
    
    private func backgroundColor() {
        backgroundColor = .darkColorApp
    }
    
    private func configConstraintsUpcomingEvent() {
        NSLayoutConstraint.activate([
                
            championshipLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            championshipLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            championshipLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            championshipLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        ])
    }

}
