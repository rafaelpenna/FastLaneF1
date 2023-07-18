//
//  ScheduleCustomTableViewCell.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 18/07/23.
//

import UIKit

class ScheduleCustomTableViewCell: UITableViewCell {
    
    var viewModel: ScheduleCellViewModel?
    static let identifier: String = String(describing: ScheduleCustomTableViewCell.self)
    var screen: ScheduleCellScreen = ScheduleCellScreen()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addElements()
        autoresizingFalse()
        configScreenConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        self.contentView.addSubview(self.screen)
    }
    
    private func autoresizingFalse() {
        screen.translatesAutoresizingMaskIntoConstraints = false
    }

    func setupCell(driver:RaceScheduleModel){
        viewModel = ScheduleCellViewModel(data: driver)
        backgroundColor = .none
        screen.roundLabel.text = "Round \(viewModel!.getRaceRound)"
        screen.countryLabel.text = viewModel?.getRaceCountry
        screen.nameEventLabel.text = viewModel?.getRaceDescription
        screen.dayLabel.text = "\(viewModel?.getRaceDay ?? 0)"
        screen.monthLabel.text = viewModel?.getRaceMonth
    }
    
    private func configScreenConstraints(){
        NSLayoutConstraint.activate([
            screen.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            screen.topAnchor.constraint(equalTo: self.topAnchor),
            screen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
