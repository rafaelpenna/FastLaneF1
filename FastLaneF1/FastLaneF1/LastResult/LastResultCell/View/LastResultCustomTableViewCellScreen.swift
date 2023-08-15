//
//  LastResultCustomTableViewCellScreen.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 02/08/23.
//

import Foundation
import UIKit

class LastResultCustomTableViewCellScreen: UIView {
    
    lazy var positionLabel: UILabel = {
        let positionLabel = UILabel()
        positionLabel.translatesAutoresizingMaskIntoConstraints = false
        positionLabel.font = UIFont.boldSystemFont(ofSize: 27)
        positionLabel.textColor = .white
        return positionLabel
    }()
        
    lazy var teamColorImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    lazy var codeLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.boldSystemFont(ofSize: 21)
        nameLabel.textColor = .white
        return nameLabel
    }()
    
    lazy var pointsLabel: UILabel = {
        let pointsLabel = UILabel()
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
        pointsLabel.font = UIFont.boldSystemFont(ofSize: 21)
        pointsLabel.textColor = .white
        return pointsLabel
    }()
    
    lazy var pointsUnitLabel: UILabel = {
        let pts = UILabel()
        pts.translatesAutoresizingMaskIntoConstraints = false
        pts.text = "pts"
        pts.font = UIFont.systemFont(ofSize: 16)
        pts.textColor = .white
        return pts
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addElements()
        self.configConstraintsInfoDriver()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements(){
        addSubview(positionLabel)
        addSubview(teamColorImage)
        addSubview(codeLabel)
        addSubview(pointsLabel)
        addSubview(pointsUnitLabel)
    }
    
    private func configConstraintsInfoDriver(){
        NSLayoutConstraint.activate([
            
            positionLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            positionLabel.centerXAnchor.constraint(equalTo: leadingAnchor, constant: 30),

            teamColorImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            teamColorImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            teamColorImage.heightAnchor.constraint(equalToConstant: 25),
            teamColorImage.widthAnchor.constraint(equalToConstant: 4),
            
            codeLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            codeLabel.leadingAnchor.constraint(equalTo: teamColorImage.trailingAnchor, constant: 5),
            
            pointsLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            pointsLabel.trailingAnchor.constraint(equalTo: pointsUnitLabel.leadingAnchor, constant: -5),
            pointsLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            pointsUnitLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            pointsUnitLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            pointsUnitLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}


