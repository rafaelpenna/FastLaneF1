//
//  LastResultCustomTableViewCell.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 02/08/23.
//

import Foundation
import UIKit

class LastResultCustomTableViewCell: UITableViewCell {
    
    var cellViewModel: LastResultCustomCellViewModel?
    static let identifier: String = String(describing: LastResultCustomTableViewCell.self)
    var screen: LastResultCustomTableViewCellScreen = LastResultCustomTableViewCellScreen()
    
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

    func setupCell(driver: LastResult){
        self.cellViewModel = LastResultCustomCellViewModel(data: driver)
        
        screen.positionLabel.text = cellViewModel?.getDriversPosition
        screen.codeLabel.text = cellViewModel?.getDriversCode
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
