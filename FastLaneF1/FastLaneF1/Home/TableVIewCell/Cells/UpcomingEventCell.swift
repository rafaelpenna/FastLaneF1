//
//  UpcomingEventTableViewCell.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 17/07/23.
//

import UIKit

class UpcomingEventCell: UITableViewCell {
    
    static let identifier = String(describing: UpcomingEventCell.self)
    
    var upcomingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "UPCOMING EVENT"
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
        addSubview(upcomingLabel)
    }
    
    private func backgroundColor() {
        backgroundColor = .darkColorApp
    }
    
    private func configConstraintsUpcomingEvent() {
        NSLayoutConstraint.activate([
                
            upcomingLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            upcomingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            upcomingLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            upcomingLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        ])
    }
}
