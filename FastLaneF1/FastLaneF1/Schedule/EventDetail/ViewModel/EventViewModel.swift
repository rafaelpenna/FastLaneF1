//
//  EventViewModel.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 18/07/23.
//

import Foundation
import UIKit

enum StandingsTypeFetch {
    case mock
    case request
}

protocol StandingsViewModelProtocol: AnyObject {
    func reloadTableView()
}

protocol StandingsViewModelDelegate: AnyObject {
    func success()
    func error(_ message: String)
}

class StandingsViewModel {
    private let standingsService: StandingsService = StandingsService()
    private let circuitService: CircuitService = CircuitService()
    private weak var delegate: StandingsViewModelDelegate?
    private var raceViewModel: ScheduleViewModel = ScheduleViewModel()
    private var dataStandings:[ResultStandingsModel] = []
    private var dataCircuit: [RaceStandingsModel] = []
    private var dataCircuitInfo: [CircuitCircuitModel] = []
    public var selectedRound: Int = 0
    
    public func delegate(delegate: StandingsViewModelDelegate?) {
        self.delegate = delegate
    }
    
    public func fetchStandings(_ typeFetch: StandingsTypeFetch){
        switch typeFetch {
        case .mock:
            self.standingsService.getStandingsDataFromJson(fromFileName: "standingsRound1") { success, error in
                if let success = success {
                    self.dataStandings = success.mrData.raceTable.races[0].results
                    self.delegate?.success()
                    self.bestLapFunctions()
                } else {
                    self.delegate?.error(error?.localizedDescription ?? "")
                }
            }
        case .request:
            self.standingsService.getStandingsData(fromURL: "https://ergast.com/api/f1/2023/\(selectedRound + 1)/results.json") { success, error in
                if let success = success {
                    if success.mrData.raceTable.races.isEmpty == false {
                        self.dataStandings = success.mrData.raceTable.races[0].results
                    } else {
                        self.dataStandings = []
                    }
                    self.delegate?.success()
                    self.bestLapFunctions()
                } else {
                    self.delegate?.error(error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    public func fetchCircuit(){
        self.circuitService.getCircuitDataFromJson(fromFileName: "seasonCircuitInfo") { success, error in
            if let success = success {
                self.dataCircuitInfo = success.mrData.circuitTable.circuits
                self.delegate?.success()
                self.trackInfoFunctions()
            } else {
                self.delegate?.error(error?.localizedDescription ?? "")
            }
        }
    }
    
    private func bestLapFunctions() {
        self.getBestLapTime()
        self.getBestLapNameDriver()
    }
    
    private func trackInfoFunctions() {
        self.getCircuitImage()
        self.getCircuitLaps()
        self.getCircuitLength()
        self.getFirstGP()
        self.getRaceDistance()
        self.getTrackRecord()
        self.getTrackRecordDriver()
        self.getTrackRecordYear()
    }
    
    
    //MARK: - Functions to get info to Drivers Standings TableView
    
    public var numberOfRowsResults:Int{
        return self.dataStandings.count
    }
    
    public func getCircuitCountryName(indexPath: IndexPath) -> String {
        return dataCircuit[indexPath.row].circuit.location.country
    }
    
    public func loadCurrentDriver(indexPath: IndexPath) -> ResultStandingsModel {
        return dataStandings[indexPath.row]
    }
    
    public func getDriverPosition(indexPath: IndexPath) -> String {
        return dataStandings[indexPath.row].position
    }
    
    public func getTeamsName(indexPath: IndexPath) -> String {
        return dataStandings[indexPath.row].constructor.name
    }
    
    public func getDriversCode(indexPath: IndexPath) -> String {
        return dataStandings[indexPath.row].driver.code
    }
    
    public func getTime(indexPath: IndexPath) -> String {
        return dataStandings[indexPath.row].time?.time ?? dataStandings[indexPath.row].status
    }
    
    public func getPointsWon(indexPath: IndexPath) -> String {
        return dataStandings[indexPath.row].points
    }
    
    //MARK: - Functions to get info to Best Lap Display
    
    public var bestLapDataName: String = ""
    public var bestLapDataTime: String = ""
    
    private func getBestLapNameDriver() {
        for n in 0..<dataStandings.count {
            if dataStandings[n].fastestLap.rank == "1" {
                bestLapDataName = dataStandings[n].driver.familyName.uppercased()
            }
        }
    }
    
    private func getBestLapTime() {
        for n in 0..<dataStandings.count {
            if dataStandings[n].fastestLap.rank == "1" {
                bestLapDataTime = dataStandings[n].fastestLap.time.time.lowercased()
            }
        }
    }
    
    //MARK: - Functions to get info to Track Data
    
    public var circuitImage: String = ""
    public var circuitNumberOfLaps: String = ""
    public var circuitLength: String = ""
    public var firstGP: String = ""
    public var raceDistance: String = ""
    public var circuitRecordName: String = ""
    public var circuitRecordTime: String = ""
    public var circuitRecordYear: String = ""
    
    private func getCircuitImage() {
        for n in 0..<dataCircuitInfo.count {
            if dataCircuitInfo[n].round == "\(selectedRound + 1)" {
                circuitImage = dataCircuitInfo[n].circuitInfo.circuitLayoutImage
            }
        }
    }
    
    private func getCircuitLength() {
        for n in 0..<dataCircuitInfo.count {
            if dataCircuitInfo[n].round == "\(selectedRound + 1)" {
                circuitLength = dataCircuitInfo[n].circuitInfo.lenght
            }
        }
    }
    
    private func getCircuitLaps() {
        for n in 0..<dataCircuitInfo.count {
            if dataCircuitInfo[n].round == "\(selectedRound + 1)" {
                circuitNumberOfLaps = dataCircuitInfo[n].circuitInfo.numberLaps
            }
        }

    }
    
    private func getFirstGP() {
        for n in 0..<dataCircuitInfo.count {
            if dataCircuitInfo[n].round == "\(selectedRound + 1)" {
                firstGP = dataCircuitInfo[n].circuitInfo.firstGrandPrix
            }
        }
    }
    
    private func getRaceDistance() {
        for n in 0..<dataCircuitInfo.count {
            if dataCircuitInfo[n].round == "\(selectedRound + 1)" {
                raceDistance = dataCircuitInfo[n].circuitInfo.raceDistance
            }
        }
    }
    
    private func getTrackRecord() {
        for n in 0..<dataCircuitInfo.count {
            if dataCircuitInfo[n].round == "\(selectedRound + 1)" {
                circuitRecordTime = dataCircuitInfo[n].circuitLapRecord.lapRecordTime
            }
        }
    }
    
    private func getTrackRecordDriver() {
        for n in 0..<dataCircuitInfo.count {
            if dataCircuitInfo[n].round == "\(selectedRound + 1)" {
                circuitRecordName = dataCircuitInfo[n].circuitLapRecord.lapRecordNameDriver
            }
        }
    }
    
    private func getTrackRecordYear() {
        for n in 0..<dataCircuitInfo.count {
            if dataCircuitInfo[n].round == "\(selectedRound + 1)" {
                circuitRecordYear = dataCircuitInfo[n].circuitLapRecord.lapRecordYear
            }
        }
    }
}
