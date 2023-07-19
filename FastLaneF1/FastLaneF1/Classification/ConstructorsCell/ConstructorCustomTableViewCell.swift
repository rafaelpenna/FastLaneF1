//
//  ConstructorCustomTableViewCell.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 19/07/23.
//

import UIKit

class ConstructorTableViewCell: UITableViewCell {

    var customInfoTeams: ConstructorCustomTableViewCellScreen = ConstructorCustomTableViewCellScreen()
    var teamsViewModel: ConstructorScreenViewModel?
    
    static let identifier: String = String(describing: ConstructorTableViewCell.self)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
   
        self.addComponents()
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addComponents() {
        customInfoTeams.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(customInfoTeams)
    }

    func setupCell(teamData: ConstructorStandingConstructorModel){
        self.teamsViewModel = ConstructorScreenViewModel(data: teamData)
        
        customInfoTeams.positionLabel.text = teamsViewModel?.getTeamsPosition
        customInfoTeams.teamLabel.text = teamsViewModel?.getTeamsName
        customInfoTeams.pointsLabel.text = teamsViewModel?.getSeasonTeamsPoints
        customInfoTeams.backgroundView.image = teamsViewModel?.getTeamsBackground
        customInfoTeams.carImage.image = teamsViewModel?.getTeamsCar
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            
            customInfoTeams.leadingAnchor.constraint(equalTo: leadingAnchor),
            customInfoTeams.trailingAnchor.constraint(equalTo: trailingAnchor),
            customInfoTeams.topAnchor.constraint(equalTo: topAnchor),
            customInfoTeams.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
