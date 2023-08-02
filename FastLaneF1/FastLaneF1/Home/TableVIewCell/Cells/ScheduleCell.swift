//
//  ScheduleCell.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 17/07/23.
//

import UIKit

class ScheduleCell: UITableViewCell {

    static let identifier = String(describing: ScheduleCell.self)
    
    var scheduleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.layer.borderWidth = 0.5
        button.setBackgroundImage(UIImage(named: "schedule"), for: .normal)
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
        addSubview(scheduleButton)
    }
    
    private func backgroundColor() {
        backgroundColor = .darkColorApp
    }
    
    private func configConstraintsUpcomingEvent() {
        NSLayoutConstraint.activate([
                
            scheduleButton.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            scheduleButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            scheduleButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            scheduleButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        ])
    }
}
