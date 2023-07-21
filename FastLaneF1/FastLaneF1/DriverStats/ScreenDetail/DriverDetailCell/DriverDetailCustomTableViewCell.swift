//
//  DriverDetailCustomTableViewCell.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 21/07/23.
//

import UIKit

class DriverDetailCustomTableViewCell: UITableViewCell {
    
    var cellViewModel: DriverDetailCustomCellViewModel?
    static let identifier: String = String(describing: DriverDetailCustomTableViewCell.self)
    var screen: DriverDetailCustomTableViewCellScreen = DriverDetailCustomTableViewCellScreen()
    
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

    func setupCell(driver: DriverDetailRace){
        self.cellViewModel = DriverDetailCustomCellViewModel(data: driver)
        
        screen.roundLabel.text = cellViewModel?.getRound
        screen.countryLabel.text = cellViewModel?.getCountry
        screen.positionLabel.text = cellViewModel?.getPoistion
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
