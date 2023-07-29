//
//  DriversCustomTableViewCell.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 19/07/23.
//

import UIKit

class DriversCustomTableViewCell: UITableViewCell {
    
    var cellViewModel: DriversCustomCellViewModel?
    static let identifier: String = String(describing: DriversCustomTableViewCell.self)
    var screen: DriversCustomTableViewCellScreen = DriversCustomTableViewCellScreen()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configScreen()
        addElements()
        configScreenConstraints()
        backgroundColor()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configScreen() {
        self.screen.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addElements(){
        self.contentView.addSubview(self.screen)
    }
    
    private func backgroundColor() {
        backgroundColor = .darkColorApp
    }

    func setupCell(driver: DriverStandingDriversModel){
        self.cellViewModel = DriversCustomCellViewModel(data: driver)
        
        screen.positionLabel.text = cellViewModel?.getDriversPosition
        screen.photoDriverImageView.image = cellViewModel?.getDriversPhoto
        screen.nameLabel.text = cellViewModel?.getDriversName
        screen.lastNameLabel.text = cellViewModel?.getDriversLastName
        screen.teamLabel.text = cellViewModel?.getTeam
        screen.pointsLabel.text = cellViewModel?.getPoints
    }
    
    private func configScreenConstraints(){
        NSLayoutConstraint.activate([
            screen.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            screen.topAnchor.constraint(equalTo: self.topAnchor),
            screen.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
