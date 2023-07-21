//
//  DriverStatsCustomTableViewCell.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 21/07/23.
//

import UIKit

class DriverStatsCustomTableViewCell: UITableViewCell {
    
    var cellViewModel: DriverStatsCustomCellViewModel?
    static let identifier: String = String(describing: DriverStatsCustomTableViewCell.self)
    var screen: DriverStatsCustomTableViewCellScreen = DriverStatsCustomTableViewCellScreen()
    
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
        backgroundColor = .none
    }

    func setupCell(driver: DriverStandingDriversModel){
        self.cellViewModel = DriverStatsCustomCellViewModel(data: driver)
        
        screen.positionLabel.text = cellViewModel?.getDriversPosition
        screen.photoDriverImageView.image = cellViewModel?.getDriversPhoto
        screen.nameLabel.text = cellViewModel?.getDriversName
        screen.lastNameLabel.text = cellViewModel?.getDriversLastName
        screen.carImage.image = cellViewModel?.getTeamCar
        screen.teamBackground.image = cellViewModel?.getTeamsBackground
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
