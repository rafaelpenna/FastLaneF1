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
        label.layer.cornerRadius = 8
        label.contentMode = .scaleAspectFit
        return label
    }()
    
    lazy var roundLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .red
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 28)
        return label
    }()
    
    lazy var nameEventLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .lightGray
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var dayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    lazy var monthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        label.layer.borderColor = UIColor.white.cgColor
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 8
        label.backgroundColor = .white
        return label
    }()
    
    lazy var fowardButton: UIImageView = {
       let fowardButton = UIImageView()
        fowardButton.translatesAutoresizingMaskIntoConstraints = false
        fowardButton.image = UIImage(named: "redFoward")
        return fowardButton
    }()
    
    lazy var divisionView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.backgroundColor = UIColor.white.cgColor
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubViews()
        self.configConstraintsInfoDriver()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubViews(){
        addSubview(flagView)
        addSubview(roundLabel)
        addSubview(countryLabel)
        addSubview(nameEventLabel)
        addSubview(dayLabel)
        addSubview(monthLabel)
        addSubview(fowardButton)
        addSubview(divisionView)
    }
    
    private func configConstraintsInfoDriver(){
        NSLayoutConstraint.activate([
            
            flagView.centerXAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            flagView.centerYAnchor.constraint(equalTo: centerYAnchor),
            flagView.widthAnchor.constraint(equalToConstant: 30),
            flagView.heightAnchor.constraint(equalToConstant: 30),
            
            roundLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            roundLabel.leadingAnchor.constraint(equalTo: flagView.trailingAnchor, constant: 10),
            
            countryLabel.topAnchor.constraint(equalTo: roundLabel.bottomAnchor, constant: 2),
            countryLabel.leadingAnchor.constraint(equalTo: roundLabel.leadingAnchor),
            
            nameEventLabel.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 4),
            nameEventLabel.leadingAnchor.constraint(equalTo: roundLabel.leadingAnchor),
            nameEventLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            
            fowardButton.widthAnchor.constraint(equalToConstant: 15),
            fowardButton.heightAnchor.constraint(equalToConstant: 20),
            fowardButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            fowardButton.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            
            divisionView.topAnchor.constraint(equalTo: nameEventLabel.bottomAnchor, constant: 20),
            divisionView.heightAnchor.constraint(equalToConstant: 0.3),
            divisionView.leadingAnchor.constraint(equalTo: flagView.leadingAnchor),
            divisionView.trailingAnchor.constraint(equalTo: fowardButton.leadingAnchor),
            
            dayLabel.topAnchor.constraint(equalTo: roundLabel.bottomAnchor, constant: -5),
            dayLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            dayLabel.widthAnchor.constraint(equalToConstant: 90),
            
            monthLabel.topAnchor.constraint(equalTo: dayLabel.bottomAnchor, constant: 4),
            monthLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            monthLabel.widthAnchor.constraint(equalToConstant: 85),
        ])
    }
}
