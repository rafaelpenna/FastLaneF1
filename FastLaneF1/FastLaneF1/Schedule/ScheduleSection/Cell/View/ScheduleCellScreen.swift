//
//  ScheduleCellScreen.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 18/07/23.
//

import UIKit

class ScheduleCellScreen: UIView {
    
    lazy var flagView: UIImageView = {
        let label = UIImageView()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.contentMode = .scaleAspectFit
        return label
    }()
    
    lazy var roundLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .red
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var dayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    lazy var monthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 13)
        label.layer.borderColor = UIColor.white.cgColor
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 8
        label.backgroundColor = .white
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubViews()
        self.configConstraintsInfoDriver()
        self.configBackgroundColor()
    }
    
    private func configBackgroundColor() {
        backgroundColor = .darkColorApp
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubViews(){
        addSubview(flagView)
        addSubview(roundLabel)
        addSubview(countryLabel)
        addSubview(dayLabel)
        addSubview(monthLabel)
    }
    
    private func configConstraintsInfoDriver(){
        NSLayoutConstraint.activate([
            
            flagView.centerXAnchor.constraint(equalTo: centerXAnchor),
            flagView.topAnchor.constraint(equalTo: monthLabel.bottomAnchor, constant: 2),
            flagView.widthAnchor.constraint(equalToConstant: 30),
            flagView.heightAnchor.constraint(equalToConstant: 30),
            
            roundLabel.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            roundLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            countryLabel.topAnchor.constraint(equalTo: flagView.bottomAnchor, constant: 2),
            countryLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            countryLabel.widthAnchor.constraint(equalToConstant: 105),
            
            dayLabel.topAnchor.constraint(equalTo: roundLabel.bottomAnchor, constant: 2),
            dayLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            dayLabel.widthAnchor.constraint(equalToConstant: 90),

            monthLabel.topAnchor.constraint(equalTo: dayLabel.bottomAnchor, constant: 4),
            monthLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            monthLabel.widthAnchor.constraint(equalToConstant: 70),
        ])
    }
}
