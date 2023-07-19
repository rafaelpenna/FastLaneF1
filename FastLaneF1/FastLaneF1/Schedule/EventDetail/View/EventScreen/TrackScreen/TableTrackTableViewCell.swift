//
//  TableTrackTableViewCell.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 18/07/23.
//

import UIKit

class TableTrackTableViewCell: UITableViewCell {

    var trackImage: TrackImageCellScreen = TrackImageCellScreen()
    var circuitLenght: CircuitLenghtCellScreen = CircuitLenghtCellScreen()
    var raceLaps: RaceLapsCellScreen = RaceLapsCellScreen()
    var firstGP: FirstGrandPrixCellScreen = FirstGrandPrixCellScreen()
    var raceDistance: RaceDistanceCellScreen = RaceDistanceCellScreen()
    var trackRecord: TrackRecordCellScreen = TrackRecordCellScreen()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        autoresizingFalse()
        addElements()
        configScreenConstraints()
    }
    
    private func autoresizingFalse(){
        trackImage.translatesAutoresizingMaskIntoConstraints = false
        circuitLenght.translatesAutoresizingMaskIntoConstraints = false
        raceLaps.translatesAutoresizingMaskIntoConstraints = false
        firstGP.translatesAutoresizingMaskIntoConstraints = false
        raceDistance.translatesAutoresizingMaskIntoConstraints = false
        trackRecord.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addElements() {
        self.contentView.addSubview(trackImage)
        self.contentView.addSubview(circuitLenght)
        self.contentView.addSubview(raceLaps)
        self.contentView.addSubview(firstGP)
        self.contentView.addSubview(raceDistance)
        self.contentView.addSubview(trackRecord)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configScreenConstraints(){
        NSLayoutConstraint.activate([
            trackImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            trackImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            trackImage.topAnchor.constraint(equalTo: self.topAnchor),
            trackImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            circuitLenght.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            circuitLenght.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            circuitLenght.topAnchor.constraint(equalTo: self.topAnchor),
            circuitLenght.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
