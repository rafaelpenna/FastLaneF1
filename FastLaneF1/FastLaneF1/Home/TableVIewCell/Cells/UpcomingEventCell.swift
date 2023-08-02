//
//  UpcomingEventTableViewCell.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 17/07/23.
//

import UIKit

class UpcomingEventCell: UITableViewCell {
    
    static let identifier = String(describing: UpcomingEventCell.self)
    
    var upcomingButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.layer.borderWidth = 0.5
        button.setBackgroundImage(UIImage(named: "nextEvent"), for: .normal)
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
        addSubview(upcomingButton)
    }
    
    private func backgroundColor() {
        backgroundColor = .darkColorApp
    }
    
    private func configConstraintsUpcomingEvent() {
        NSLayoutConstraint.activate([
                
            upcomingButton.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            upcomingButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            upcomingButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            upcomingButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        ])
    }
}
