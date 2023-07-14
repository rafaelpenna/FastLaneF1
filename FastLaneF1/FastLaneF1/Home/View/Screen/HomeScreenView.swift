//
//  HomeScreen.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 14/07/23.
//

import Foundation
import UIKit

class HomeScreenView: UIView {
    
    lazy var homeTableView: UITableView = {
        let homeTableView = UITableView()
        homeTableView.translatesAutoresizingMaskIntoConstraints = false
        homeTableView.separatorStyle = .none
        homeTableView.layer.backgroundColor = .none
//        homeTableView.register(<#T##cellClass: AnyClass?##AnyClass?#>, forCellReuseIdentifier: <#T##String#>)
        return UITableView()
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        backgroundColor()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(homeTableView)
    }
    
    private func backgroundColor() {
        backgroundColor = .darkColorApp
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            homeTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            homeTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            homeTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            homeTableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        ])
    }
    
}
