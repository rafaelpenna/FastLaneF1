//
//  LatestResult.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 17/07/23.
//

import UIKit

class LatestResultCell: UITableViewCell {

    static let identifier = String(describing: LatestResultCell.self)
    
    var latestResultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "LATEST RESULT"
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
        addSubview(latestResultLabel)
    }
    
    private func backgroundColor() {
        backgroundColor = .darkColorApp
    }
    
    private func configConstraintsUpcomingEvent() {
        NSLayoutConstraint.activate([
                
            latestResultLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            latestResultLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            latestResultLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            latestResultLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        ])
    }

}


