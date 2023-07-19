//
//  HeaderStandings.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 18/07/23.
//

import UIKit

class HeaderStandings: UIView {
    
    var standingsViewModel: StandingsViewModel = StandingsViewModel()
    
    lazy var standoutDriverView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkColorApp
        return view
    }()
    
    lazy var headerInformationView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
//MARK: - Header Information Elements
    
    lazy var posTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "POS"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    lazy var driverTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "DRIVER"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    lazy var timeTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "TIME/RET"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    lazy var ptsTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "PTS"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
//MARK: - Best Lap (Standout) Elements
    
    lazy var standoutBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkColorApp
        return view
    }()
    
    lazy var standoutTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "BEST LAP"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .red
        return label
    }()
    
    lazy var standoutNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .white
        return label
    }()
    
    lazy var standoutTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.italicSystemFont(ofSize: 22)
        label.textColor = .white
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
    }
    
    private func addElements() {
        
        self.addSubview(standoutDriverView)
        self.addSubview(headerInformationView)
        
        headerInformationView.self.addSubview(posTitleLabel)
        headerInformationView.self.addSubview(driverTitleLabel)
        headerInformationView.self.addSubview(timeTitleLabel)
        headerInformationView.self.addSubview(ptsTitleLabel)
        
        standoutDriverView.self.addSubview(standoutBackgroundView)
        standoutBackgroundView.self.addSubview(standoutNameLabel)
        standoutBackgroundView.self.addSubview(standoutTitleLabel)
        standoutBackgroundView.self.addSubview(standoutTimeLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            
            standoutDriverView.topAnchor.constraint(equalTo: topAnchor),
            standoutDriverView.leadingAnchor.constraint(equalTo: leadingAnchor),
            standoutDriverView.trailingAnchor.constraint(equalTo: trailingAnchor),
            standoutDriverView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            headerInformationView.heightAnchor.constraint(equalToConstant: 22),
            headerInformationView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerInformationView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerInformationView.bottomAnchor.constraint(equalTo: bottomAnchor),

            posTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            posTitleLabel.topAnchor.constraint(equalTo: headerInformationView.topAnchor, constant: 1),

            driverTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 55),
            driverTitleLabel.topAnchor.constraint(equalTo: headerInformationView.topAnchor, constant: 1),

            timeTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 15),
            timeTitleLabel.topAnchor.constraint(equalTo: headerInformationView.topAnchor, constant: 1),

            ptsTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
            ptsTitleLabel.topAnchor.constraint(equalTo: headerInformationView.topAnchor, constant: 1),

            //MARK: - Best Lap (Standout) Constraints

            standoutBackgroundView.topAnchor.constraint(equalTo: standoutDriverView.topAnchor, constant: 10),
            standoutBackgroundView.leadingAnchor.constraint(equalTo: standoutDriverView.leadingAnchor, constant: 25),
            standoutBackgroundView.trailingAnchor.constraint(equalTo: standoutDriverView.trailingAnchor, constant: -25),
            standoutBackgroundView.bottomAnchor.constraint(equalTo: standoutDriverView.bottomAnchor, constant: -5),

            standoutTitleLabel.topAnchor.constraint(equalTo: standoutBackgroundView.topAnchor, constant: 2),
            standoutTitleLabel.leadingAnchor.constraint(equalTo: standoutBackgroundView.leadingAnchor, constant: 10),

            standoutNameLabel.leadingAnchor.constraint(equalTo: standoutBackgroundView.leadingAnchor, constant: 10),
            standoutNameLabel.topAnchor.constraint(equalTo: standoutBackgroundView.topAnchor, constant: 25),

            standoutTimeLabel.trailingAnchor.constraint(equalTo: standoutBackgroundView.trailingAnchor, constant: -15),
            standoutTimeLabel.topAnchor.constraint(equalTo: standoutBackgroundView.topAnchor, constant: 30),
        ])
    }
}
