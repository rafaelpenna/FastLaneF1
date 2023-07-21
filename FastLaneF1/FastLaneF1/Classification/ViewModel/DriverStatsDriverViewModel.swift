//
//  ClassificationViewModel.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 19/07/23.
//

import UIKit

enum DriversTypeFetch {
    case mock
    case request
}

protocol DriversViewModelProtocol: AnyObject {
    func reloadTableView()
}

protocol DriversViewModelDelegate: AnyObject {
    func success()
    func error(_ message: String)
}

class ClassificationDriverViewModel {
    private let service: DriversService = DriversService()
    private weak var delegate: DriversViewModelDelegate?
    private var dataDriversScreen:[DriverStandingDriversModel] = []
    
    public func delegate(delegate: DriversViewModelDelegate?) {
        self.delegate = delegate
    }
    
    public func fetch(_ typeFetch: DriversTypeFetch){
        switch typeFetch {
        case .mock:
            self.service.getDriversDataFromJson(fromFileName: "seasonDrivers") { success, error in
                if let success = success {
                    self.dataDriversScreen = success.mrData.standingsTable.standingsLists[0].driverStandings
                    self.delegate?.success()
                } else {
                    self.delegate?.error(error?.localizedDescription ?? "")
                }
            }
        case .request:
            self.service.getDriversData(fromURL: "https://ergast.com/api/f1/current/driverStandings.json") { success, error in
                if let success = success {
                    self.dataDriversScreen = success.mrData.standingsTable.standingsLists[0].driverStandings
                    self.delegate?.success()
                } else {
                    self.delegate?.error(error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    //MARK: - Functions to get info to TableView Drivers
    
    public var numberOfRows:Int{
        return dataDriversScreen.count
    }
    
    public func loadCurrentDriver(indexPath: IndexPath) -> DriverStandingDriversModel {
        return dataDriversScreen[indexPath.row]
    }
    
    public func getDriverPosition(indexPath: IndexPath) -> String {
        return dataDriversScreen[indexPath.row].position
    }
    
    public func getDriverName(indexPath: IndexPath) -> String {
        return dataDriversScreen[indexPath.row].driver.givenName
    }
    
    public func getDriverLastName(indexPath: IndexPath) -> String {
        return dataDriversScreen[indexPath.row].driver.familyName
    }
    
    public func getTeam(indexPath: IndexPath) -> String {
        return dataDriversScreen[indexPath.row].constructors[2].name
    }
    
    public func getPoints(indexPath: IndexPath) -> String {
        return dataDriversScreen[indexPath.row].points
    }

}
