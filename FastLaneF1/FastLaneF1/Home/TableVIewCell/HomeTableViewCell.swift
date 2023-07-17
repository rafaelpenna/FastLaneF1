//
//  HomeTableViewCell.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 17/07/23.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    var screen: UpcomingEventTableViewCell = UpcomingEventTableViewCell()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        autoresizingFalse()
        addElements()
        configHomeTableViewConstraints()
        backgroundColor()
    }
    
    private func autoresizingFalse() {
        self.screen.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        self.contentView.addSubview(self.screen)
    }
    
    private func backgroundColor() {
        self.backgroundColor = .darkColorApp
    }
    
    private func configHomeTableViewConstraints(){
        NSLayoutConstraint.activate([
            screen.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            screen.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            screen.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            screen.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }
}
