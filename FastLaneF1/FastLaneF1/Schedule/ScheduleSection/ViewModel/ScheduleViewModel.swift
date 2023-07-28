//
//  ScheduleViewModel.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 18/07/23.
//
import UIKit

enum ScheduleTypeFetch {
    case mock
    case request
}

protocol ScheduleViewModelProtocol: AnyObject {
    func reloadTableView()
}

protocol ScheduleViewModelDelegate: AnyObject {
    func success()
    func error(_ message: String)
}

class ScheduleViewModel {
    private let service: ScheduleService = ScheduleService()
    private weak var delegate: ScheduleViewModelDelegate?
    private var dataScheduleScreen:[RaceScheduleModel] = []
    
    public func delegate(delegate: ScheduleViewModelDelegate?) {
        self.delegate = delegate
    }
    
    public func fetchSchedule(_ typeFetch: ScheduleTypeFetch){
        switch typeFetch {
        case .mock:
            self.service.getScheduleDataFromJson(fromFileName: "schedule") { success, error in
                if let success = success {
                    self.dataScheduleScreen = success.mrData.raceTable.races
                    self.delegate?.success()
                } else {
                    self.delegate?.error(error?.localizedDescription ?? "")
                }
            }
        case .request:
            self.service.getScheduleData(fromURL: "https://ergast.com/api/f1/current.json") { success, error in
                if let success = success {
                    self.dataScheduleScreen = success.mrData.raceTable.races
                    self.delegate?.success()
                } else {
                    self.delegate?.error(error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    //MARK: - Functions to get info to TableView Races
    
    public var numberOfRows:Int{
        return self.dataScheduleScreen.count
    }
    
    public func loadCurrentRace(indexPath: IndexPath) -> RaceScheduleModel {
        return dataScheduleScreen[indexPath.row]
    }
    
    public func getRaceRound(indexPath: IndexPath) -> String {
        return dataScheduleScreen[indexPath.row].round
    }
    
    public func getRaceCountry(indexPath: IndexPath) -> String {
        return dataScheduleScreen[indexPath.row].circuit.location.country
    }
    
    public func getRaceDescription(indexPath: IndexPath) -> String {
        return dataScheduleScreen[indexPath.row].raceName
    }
    
    public func getRaceDay(indexPath: IndexPath) -> String {
        return dataScheduleScreen[indexPath.row].date
    }
    
    public func getRaceMonth(indexPath: IndexPath) -> String {
        return dataScheduleScreen[indexPath.row].date
    }
    
//    public func getRaceFlag(indexPath: IndexPath) -> UIImage {
//        if dataScheduleScreen[indexPath.row].circuit.location.country == "Bahrain" {
//            return UIImage(systemName: "bahrain") ?? UIImage()
//        } else if dataScheduleScreen[indexPath.row].circuit.location.country == "Saudi Arabia" {
//            return UIImage(systemName: "saudiarabia") ?? UIImage()
//        } else if dataScheduleScreen[indexPath.row].circuit.location.country == "Australia" {
//            return UIImage(systemName: "australia") ?? UIImage()
//        } else if dataScheduleScreen[indexPath.row].circuit.location.country == "Azerbaijan" {
//            return UIImage(systemName: "azerbaijan") ?? UIImage()
//        } else if dataScheduleScreen[indexPath.row].circuit.location.country == "USA" {
//            return UIImage(systemName: "us") ?? UIImage()
//        } else if dataScheduleScreen[indexPath.row].circuit.location.country == "Monaco" {
//            return UIImage(systemName: "monaco") ?? UIImage()
//        } else if dataScheduleScreen[indexPath.row].circuit.location.country == "Spain" {
//            return UIImage(systemName: "spain") ?? UIImage()
//        } else if dataScheduleScreen[indexPath.row].circuit.location.country == "Canada" {
//            return UIImage(systemName: "canada") ?? UIImage()
//        } else if dataScheduleScreen[indexPath.row].circuit.location.country == "Austria" {
//            return UIImage(systemName: "austria") ?? UIImage()
//        } else if dataScheduleScreen[indexPath.row].circuit.location.country == "UK" {
//            return UIImage(systemName: "uk") ?? UIImage()
//        } else if dataScheduleScreen[indexPath.row].circuit.location.country == "Hungary" {
//            return UIImage(systemName: "hungary") ?? UIImage()
//        } else if dataScheduleScreen[indexPath.row].circuit.location.country == "Netherlands" {
//            return UIImage(systemName: "netherland") ?? UIImage()
//        } else if dataScheduleScreen[indexPath.row].circuit.location.country == "Belgium" {
//            return UIImage(systemName: "belgium") ?? UIImage()
//        } else if dataScheduleScreen[indexPath.row].circuit.location.country == "Italy" {
//            return UIImage(systemName: "italy") ?? UIImage()
//        } else if dataScheduleScreen[indexPath.row].circuit.location.country == "Singapore" {
//            return UIImage(systemName: "singapore") ?? UIImage()
//        } else if dataScheduleScreen[indexPath.row].circuit.location.country == "Japan" {
//            return UIImage(systemName: "japan") ?? UIImage()
//        } else if dataScheduleScreen[indexPath.row].circuit.location.country == "Qatar" {
//            return UIImage(systemName: "qatar") ?? UIImage()
//        } else if dataScheduleScreen[indexPath.row].circuit.location.country == "Mexico" {
//            return UIImage(systemName: "mexico") ?? UIImage()
//        } else if dataScheduleScreen[indexPath.row].circuit.location.country == "Brazil" {
//            return UIImage(systemName: "brazil") ?? UIImage()
//        } else if dataScheduleScreen[indexPath.row].circuit.location.country == "Abu Dhabi" {
//            return UIImage(systemName: "abudhabi") ?? UIImage()
//        }
//        return UIImage()
//    }
}
