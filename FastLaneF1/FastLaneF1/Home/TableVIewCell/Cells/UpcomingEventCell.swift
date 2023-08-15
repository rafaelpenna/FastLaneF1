//
//  UpcomingEventTableViewCell.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 17/07/23.
//

import UIKit

protocol BuyTicketButtonTableViewCellProtocol: AnyObject {
    func buyTicketActionButton()
}

class UpcomingEventCell: UITableViewCell {
    
    static let identifier = String(describing: UpcomingEventCell.self)
    
    private weak var delegate: BuyTicketButtonTableViewCellProtocol?
    func delegate(delegate: BuyTicketButtonTableViewCellProtocol?) {
        self.delegate = delegate
    }
    
    lazy var nextEventBackground: UIImageView = {
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
    
    lazy var nextRaceLabel: UILabel = {
        let nextRaceLabel = UILabel()
        nextRaceLabel.translatesAutoresizingMaskIntoConstraints = false
        nextRaceLabel.font = UIFont.systemFont(ofSize: 28)
        nextRaceLabel.textColor = .white
        nextRaceLabel.text = "Next Race"
        return nextRaceLabel
    }()
    
    lazy var countryRaceName: UILabel = {
        let countryRaceName = UILabel()
        countryRaceName.translatesAutoresizingMaskIntoConstraints = false
        countryRaceName.font = UIFont.systemFont(ofSize: 22)
        countryRaceName.textColor = .white
        return countryRaceName
    }()
    
    lazy var circuitName: UILabel = {
        let circuitName = UILabel()
        circuitName.translatesAutoresizingMaskIntoConstraints = false
        circuitName.font = UIFont.systemFont(ofSize: 18)
        circuitName.textColor = .white
        return circuitName
    }()
    
    lazy var dateEvent: UILabel = {
        let dateEvent = UILabel()
        dateEvent.translatesAutoresizingMaskIntoConstraints = false
        dateEvent.font = UIFont.systemFont(ofSize: 24)
        dateEvent.textColor = .white
        return dateEvent
    }()
    
    lazy var buyTicketButton: UIButton = {
       let buyTicketButton = UIButton()
        buyTicketButton.translatesAutoresizingMaskIntoConstraints = false
        buyTicketButton.backgroundColor = .red
        buyTicketButton.setTitle("BUY TICKET", for: .normal)
        buyTicketButton.tintColor = .white
        buyTicketButton.layer.cornerRadius = 10
        buyTicketButton.addTarget(self, action: #selector(buyTicketAction), for: .touchUpInside)
        return buyTicketButton
    }()
    
    @objc func buyTicketAction() {
        delegate?.buyTicketActionButton()
    }
    
    public func configure() {
        addElements()
        backgroundColor()
        configConstraints()
    }
    
    public func addElements() {
        addSubview(nextEventBackground)
        addSubview(flagCountryEvent)
        addSubview(countryRaceName)
        addSubview(circuitName)
        addSubview(nextRaceLabel)
        addSubview(dateEvent)
        addSubview(buyTicketButton)
    }
    
    private func backgroundColor() {
        backgroundColor = .black
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            
            nextEventBackground.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            nextEventBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            nextEventBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            nextEventBackground.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            flagCountryEvent.topAnchor.constraint(equalTo: nextRaceLabel.bottomAnchor),
            flagCountryEvent.centerXAnchor.constraint(equalTo: centerXAnchor),
            flagCountryEvent.heightAnchor.constraint(equalToConstant: 100),
            flagCountryEvent.widthAnchor.constraint(equalToConstant: 100),
            
            nextRaceLabel.topAnchor.constraint(equalTo: nextEventBackground.topAnchor, constant: 10),
            nextRaceLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            countryRaceName.topAnchor.constraint(equalTo: flagCountryEvent.bottomAnchor),
            countryRaceName.centerXAnchor.constraint(equalTo: centerXAnchor),

            circuitName.topAnchor.constraint(equalTo: countryRaceName.bottomAnchor, constant: 5),
            circuitName.centerXAnchor.constraint(equalTo: centerXAnchor),

            dateEvent.topAnchor.constraint(equalTo: circuitName.bottomAnchor, constant: 15),
            dateEvent.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            buyTicketButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            buyTicketButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            buyTicketButton.topAnchor.constraint(equalTo: dateEvent.bottomAnchor, constant: 5),
        ])
    }
}
