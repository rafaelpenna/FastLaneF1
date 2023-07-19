//
//  TrackImageCellScreen.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 18/07/23.
//

import UIKit

class TrackImageCellScreen: UITableViewCell {

    static let identifier = String(describing: TrackImageCellScreen.self)
    
    lazy var trackImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "interlagos")
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.layer.borderWidth = 0.5
        return image
    }()
    
    public func configure() {
        addElements()
        setBackgroundColor()
        configConstraintsInfoDriver()
    }
    
    private func addElements(){
        addSubview(trackImage)
    }
    
    private func setBackgroundColor() {
        backgroundColor = .darkColorApp
    }
    
    private func configConstraintsInfoDriver(){
        NSLayoutConstraint.activate([

            trackImage.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            trackImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            trackImage.widthAnchor.constraint(equalToConstant: 350),
            trackImage.heightAnchor.constraint(equalToConstant: 300),
        ])
    }
}

