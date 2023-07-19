//
//  TrackRecordCellScreen.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 18/07/23.
//

import UIKit

class TrackRecordCellScreen: UITableViewCell {

    static let identifier = String(describing: TrackRecordCellScreen.self)
    
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
    
    lazy var trackRecordTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Track Record"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    lazy var trackRecordAnswer: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 45)
        label.textColor = .white
        return label
    }()
    
    lazy var trackRecordOwner: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.italicSystemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    lazy var trackRecordYear: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
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
        addSubview(trackRecordTitle)
        addSubview(trackRecordAnswer)
        addSubview(trackRecordOwner)
        addSubview(trackRecordYear)
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
            
            trackRecordTitle.leadingAnchor.constraint(equalTo: backgroundCellWhiteView.leadingAnchor, constant: 7),
            trackRecordTitle.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            
            trackRecordAnswer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            trackRecordAnswer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            
            trackRecordOwner.trailingAnchor.constraint(equalTo: trackRecordYear.leadingAnchor, constant: -2),
            trackRecordOwner.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14),
            
            trackRecordYear.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            trackRecordYear.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14),
        ])
    }
}
