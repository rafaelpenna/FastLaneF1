//
//  ChampionshipStandingsCell.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 17/07/23.
//

import UIKit

class ChampionshipStandingsCell: UITableViewCell {

    static let identifier = String(describing: ChampionshipStandingsCell.self)
    
    var championshipButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.layer.borderWidth = 0.5
        button.setBackgroundImage(UIImage(named: "standings"), for: .normal)
        button.contentMode = .scaleAspectFill
        button.layer.backgroundColor = UIColor.darkGray.cgColor
        return button
    }()
    
    public func configure() {
        addSubviews()
        configConstraintsUpcomingEvent()
        backgroundColor()
    }
    
    private func addSubviews() {
        addSubview(championshipButton)
    }
    
    private func backgroundColor() {
        backgroundColor = .darkColorApp
    }
    
    private func configConstraintsUpcomingEvent() {
        NSLayoutConstraint.activate([
                
            championshipButton.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            championshipButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            championshipButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            championshipButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        ])
    }

}
