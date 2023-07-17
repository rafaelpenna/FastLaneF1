//
//  HomeTableViewCell.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 17/07/23.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    var upcomingCellScreen: UpcomingEventCell = UpcomingEventCell()
    var latestResultCellScreen: LatestResultCell = LatestResultCell()
    var championshipStandingsCellScreen: ChampionshipStandingsCell = ChampionshipStandingsCell()
    var scheduleCellScreen: ScheduleCell = ScheduleCell()
    
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
        self.championshipStandingsCellScreen.translatesAutoresizingMaskIntoConstraints = false
        self.scheduleCellScreen.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        self.contentView.addSubview(self.upcomingCellScreen)
        self.contentView.addSubview(self.latestResultCellScreen)
        self.contentView.addSubview(self.championshipStandingsCellScreen)
        self.contentView.addSubview(self.scheduleCellScreen)
    }
    
    private func backgroundColor() {
        self.backgroundColor = .darkColorApp
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
            
            championshipStandingsCellScreen.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            championshipStandingsCellScreen.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            championshipStandingsCellScreen.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            championshipStandingsCellScreen.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            scheduleCellScreen.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            scheduleCellScreen.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            scheduleCellScreen.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            scheduleCellScreen.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }
}
