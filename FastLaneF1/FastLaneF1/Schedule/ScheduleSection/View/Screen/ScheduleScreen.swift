//
//  ScheduleScreen.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 18/07/23.
//

import UIKit

class ScheduleScreen: UIView {
    
    lazy var racesHeaderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Events"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 35)
        return label
    }()
    
    private let layout = UICollectionViewFlowLayout()

    lazy var infoRacesCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.separatorStyle = .none
        collectionView.backgroundColor = .none
        collectionView.frame = bounds
        collectionView.register(ScheduleCustomCollectionViewCell.self, forCellWithReuseIdentifier: ScheduleCustomCollectionViewCell.identifier)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        setBackgroundColor()
        configConstraints()
        configLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(infoRacesCollectionView)
        addSubview(racesHeaderLabel)
    }
    
    private func configLayout() {
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 2
        layout.itemSize = CGSize(width: 118, height: 140)
    }
    
    private func setBackgroundColor() {
        backgroundColor = .black
    }
    
    
    public func setupTableViewProtocols(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource){
        infoRacesCollectionView.delegate = delegate
        infoRacesCollectionView.dataSource = dataSource
    }

    private func configConstraints(){
        NSLayoutConstraint.activate([
            
            racesHeaderLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            racesHeaderLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            infoRacesCollectionView.topAnchor.constraint(equalTo: racesHeaderLabel.bottomAnchor, constant: 15),
            infoRacesCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            infoRacesCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            infoRacesCollectionView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
        ])
    }
}
