//
//  HomeTableViewCell.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 17/07/23.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    var upcomingCellScreen: UpcomingEventCell = UpcomingEventCell()
    var latestResultCellScreen: LastResultCell = LastResultCell()
    
    let nextEventViewModel: NextEventViewModel = NextEventViewModel()
    
    static let identifier: String = String(describing: HomeTableViewCell.self)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        autoresizingFalse()
        addElements()
        configHomeTableViewConstraints()
        backgroundColor()
    }
    
    private func autoresizingFalse() {
        self.upcomingCellScreen.translatesAutoresizingMaskIntoConstraints = false
        self.latestResultCellScreen.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        self.contentView.addSubview(self.upcomingCellScreen)
        self.contentView.addSubview(self.latestResultCellScreen)
    }
    
    private func backgroundColor() {
        self.backgroundColor = .black
    }
    
    private func configHomeTableViewConstraints(){
        NSLayoutConstraint.activate([
            upcomingCellScreen.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            upcomingCellScreen.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            upcomingCellScreen.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            upcomingCellScreen.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            latestResultCellScreen.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            latestResultCellScreen.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            latestResultCellScreen.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            latestResultCellScreen.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }
}
