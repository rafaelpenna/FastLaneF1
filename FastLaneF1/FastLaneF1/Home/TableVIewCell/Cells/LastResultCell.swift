//
//  LatestResult.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 17/07/23.
//

import UIKit

protocol LastResultButtonTableViewCellProtocol: AnyObject {
    func moreInformationActionButton()
}

class LastResultCell: UITableViewCell {
    
    static let identifier = String(describing: LastResultCell.self)
    
    private weak var delegate: LastResultButtonTableViewCellProtocol?
    func delegate(delegate: LastResultButtonTableViewCellProtocol?) {
        self.delegate = delegate
    }
    
    lazy var lastEventBackground: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkColorApp
        return view
    }()
    
    lazy var flagCountryEvent: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var lastRaceLabel: UILabel = {
        let nextRaceLabel = UILabel()
        nextRaceLabel.translatesAutoresizingMaskIntoConstraints = false
        nextRaceLabel.font = UIFont.systemFont(ofSize: 28)
        nextRaceLabel.textColor = .white
        nextRaceLabel.text = "Last Event"
        return nextRaceLabel
    }()
    
    lazy var circuitName: UILabel = {
        let circuitName = UILabel()
        circuitName.translatesAutoresizingMaskIntoConstraints = false
        circuitName.font = UIFont.systemFont(ofSize: 22)
        circuitName.textColor = .white
        return circuitName
    }()
    
    lazy var firstPlace: UILabel = {
        let circuitName = UILabel()
        circuitName.translatesAutoresizingMaskIntoConstraints = false
        circuitName.font = UIFont.systemFont(ofSize: 18)
        circuitName.textColor = .white
        return circuitName
    }()
    
    lazy var lastResultInfoButton: UIButton = {
       let buyTicketButton = UIButton()
        buyTicketButton.translatesAutoresizingMaskIntoConstraints = false
        buyTicketButton.backgroundColor = .red
        buyTicketButton.setTitle("MORE INFORMATION", for: .normal)
        buyTicketButton.tintColor = .white
        buyTicketButton.layer.cornerRadius = 10
        buyTicketButton.addTarget(self, action: #selector(lastResultMoreInfo), for: .touchUpInside)
        return buyTicketButton
    }()
    
    @objc func lastResultMoreInfo() {
        delegate?.moreInformationActionButton()
    }
    
    public func configure() {
        addElements()
        backgroundColor()
        configConstraints()
    }
    
    public func addElements() {
        addSubview(lastEventBackground)
        addSubview(flagCountryEvent)
        addSubview(circuitName)
        addSubview(lastRaceLabel)
        addSubview(firstPlace)
        addSubview(lastResultInfoButton)
    }
    
    private func backgroundColor() {
        backgroundColor = .black
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            
            lastEventBackground.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            lastEventBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            lastEventBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            lastEventBackground.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            lastRaceLabel.topAnchor.constraint(equalTo: lastEventBackground.topAnchor, constant: 15),
            lastRaceLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            flagCountryEvent.topAnchor.constraint(equalTo: lastRaceLabel.bottomAnchor),
            flagCountryEvent.centerXAnchor.constraint(equalTo: centerXAnchor),
            flagCountryEvent.heightAnchor.constraint(equalToConstant: 100),
            flagCountryEvent.widthAnchor.constraint(equalToConstant: 100),

            circuitName.topAnchor.constraint(equalTo: flagCountryEvent.bottomAnchor),
            circuitName.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            firstPlace.topAnchor.constraint(equalTo: circuitName.bottomAnchor, constant: 5),
            firstPlace.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            lastResultInfoButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            lastResultInfoButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            lastResultInfoButton.topAnchor.constraint(equalTo: firstPlace.bottomAnchor, constant: 20),
        ])
    }
}
