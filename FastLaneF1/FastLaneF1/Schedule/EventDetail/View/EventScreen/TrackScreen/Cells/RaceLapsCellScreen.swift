//
//  RaceLapsCellScreen.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 18/07/23.
//

import UIKit

class RaceLapsCellScreen: UITableViewCell {

    static let identifier = String(describing: RaceLapsCellScreen.self)
    
    lazy var backgroundCellWhiteView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkColorApp
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.white.cgColor
        return view
    }()
    
    lazy var trackLapsTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Number of Laps"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    lazy var trackLapsAnswer: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 45)
        label.textColor = .white
        return label
    }()
    
    public func configure() {
        addElements()
        setBackgroundColor()
        configConstraintsInfoDriver()
    }
    
    private func addElements(){
        addSubview(backgroundCellWhiteView)
        addSubview(trackLapsTitle)
        addSubview(trackLapsAnswer)
    }
    
    private func setBackgroundColor() {
        backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1)
    }
    
    private func configConstraintsInfoDriver(){
        NSLayoutConstraint.activate([
            
            backgroundCellWhiteView.topAnchor.constraint(equalTo: topAnchor),
            backgroundCellWhiteView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            backgroundCellWhiteView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            backgroundCellWhiteView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            trackLapsTitle.leadingAnchor.constraint(equalTo: backgroundCellWhiteView.leadingAnchor, constant: 7),
            trackLapsTitle.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            
            trackLapsAnswer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            trackLapsAnswer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
        ])
    }
}
