//
//  UpcomingEventTableViewCell.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 17/07/23.
//

import UIKit

class UpcomingEventTableViewCell: UIView {
    
    static let identifier = String(describing: UpcomingEventTableViewCell.self)
    
    var upcomingabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "UPCOMING EVENT"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        configConstraintsUpcomingEvent()
        backgroundColor()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(upcomingabel)
    }
    
    private func backgroundColor() {
        backgroundColor = .red
    }
    
    private func configConstraintsUpcomingEvent() {
        NSLayoutConstraint.activate([
                
            upcomingabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            upcomingabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -5),
            upcomingabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 5),
            upcomingabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
        ])
    }
}
