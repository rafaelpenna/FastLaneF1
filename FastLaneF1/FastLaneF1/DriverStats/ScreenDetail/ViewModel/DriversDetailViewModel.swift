//
//  DriversDetailViewModel.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 21/07/23.
//

import UIKit

enum DriverDetailTypeFetch {
    case mock
    case request
}

protocol DriverDetailViewModelProtocol: AnyObject {
    func reloadTableView()
}

protocol DriverDetailViewModelDelegate: AnyObject {
    func success()
    func error(_ message: String)
}

class DriverDetailViewModel {
    private let service: DriversDetailService = DriversDetailService()

    private weak var delegate: DriverDetailViewModelDelegate?
    private var dataDriversDetail:[DriverDetailRace] = []
    
    public func delegate(delegate: DriverDetailViewModelDelegate?) {
        self.delegate = delegate
    }
    
    public func fetch(_ typeFetch: DriverDetailTypeFetch){
        switch typeFetch {
        case .mock:
            self.service.getDriversDetailDataFromJson(fromFileName: "seasonDrivers") { success, error in
                if let success = success {
                    self.dataDriversDetail = success.mrData.raceTable.races
                    self.delegate?.success()
                } else {
                    self.delegate?.error(error?.localizedDescription ?? "")
                }
            }
        case .request:
            self.service.getDriversDetailData(fromURL: "https://ergast.com/api/f1/current/drivers/alonso/results.json") { success, error in
                if let success = success {
                    self.dataDriversDetail = success.mrData.raceTable.races
                    self.delegate?.success()
                } else {
                    self.delegate?.error(error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    //MARK: - Functions to get info to TableView Drivers Detail
    
    public var numberOfRows:Int{
        return dataDriversDetail.count
    }
    
    public func loadCurrentRound(indexPath: IndexPath) -> DriverDetailRace {
        return dataDriversDetail[indexPath.row]
    }
    
    public func getRound(indexPath: IndexPath) -> String {
        return dataDriversDetail[indexPath.row].round
    }
    
    public func getRoundCountry(indexPath: IndexPath) -> String {
        return dataDriversDetail[indexPath.row].circuit.location.country
    }
    
    public func getRoundPosition(indexPath: IndexPath) -> String {
        return dataDriversDetail[indexPath.row].results[0].position
    }
    
    public func getRoundPoints(indexPath: IndexPath) -> String {
        return dataDriversDetail[indexPath.row].results[0].points
    }
}
