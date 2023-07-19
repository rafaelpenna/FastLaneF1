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
}
