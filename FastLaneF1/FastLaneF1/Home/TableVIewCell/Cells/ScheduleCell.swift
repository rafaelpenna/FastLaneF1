//
//  ScheduleCell.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 17/07/23.
//

import UIKit

class ScheduleCell: UITableViewCell {

    static let identifier = String(describing: ScheduleCell.self)
    
    var scheduleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Schedule"
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
        addSubview(scheduleLabel)
    }
    
    private func backgroundColor() {
        backgroundColor = .darkColorApp
    }
    
    private func configConstraintsUpcomingEvent() {
        NSLayoutConstraint.activate([
                
            scheduleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            scheduleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            scheduleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            scheduleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        ])
    }

}
