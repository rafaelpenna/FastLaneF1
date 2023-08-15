//
//  LastResultViewModel.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 04/08/23.
//

import Foundation
import UIKit

protocol LastResultViewModelProtocol: AnyObject {
    func lastEventReloadTableView()
}

protocol LastResultViewModelDelegate: AnyObject {
    func success()
    func error(_ message: String)
}

class LastResultViewModel {
    private let lastResultStandingsService: LastResultService = LastResultService()
    private let driverInfoService: DriverInfoService = DriverInfoService()
    private weak var delegate: LastResultViewModelDelegate?
    private var dataResults: [LastResultRace] = []
    private var dataDriver: [DriverInfoRace] = []
    var driverWinnerID: String = ""
    
    public func delegate(delegate: LastResultViewModelDelegate?) {
        self.delegate = delegate
    }
    
    public func fetchLastResult() {
            self.lastResultStandingsService.getLastResultData(fromURL: "https://ergast.com/api/f1/current/last/results.json") { result in
                DispatchQueue.main.async {
                    switch result {
                    case let .failure(error):
                        print(error)
                    case let .success(dataResults):
                        self.dataResults = dataResults.mrData.raceTable.races
                        self.delegate?.success()
                }
            }
        }
    }
    
    public func fetchDriverInfo() {
        self.driverInfoService.getDriverInfoData(fromURL: "https://ergast.com/api/f1/2023/drivers/max_verstappen/results.json") { result in
            DispatchQueue.main.async {
                switch result {
                case let .failure(error):
                    print(error)
                case let .success(dataDriver):
                    self.dataDriver = dataDriver.mrData.raceTable.races
                    self.delegate?.success()
                }
            }
        }
    }
    
    public var roundEvent: String {
        return dataResults[0].round
    }
    
    public var circuitName: String {
        return dataResults[0].circuit.circuitName
    }
    
    public var circuitCountry: String {
        return dataResults[0].raceName
    }
    
    public var numberOfRows: Int {
        return dataResults[0].results.count
    }
    
    public func loadCurrentDriver(indexPath: IndexPath) -> LastResult {
        return dataResults[0].results[indexPath.row]
    }
    
    public func getDriverPosition(indexPath: IndexPath) -> String {
        return dataResults[0].results[indexPath.row].position
    }
    
    public func getDriverName(indexPath: IndexPath) -> String {
        return dataResults[0].results[indexPath.row].driver.givenName
    }
    
    public func getDriverLastName(indexPath: IndexPath) -> String {
        return dataResults[0].results[indexPath.row].driver.familyName
    }
    
    public func getTeam(indexPath: IndexPath) -> String {
        return dataResults[0].results[indexPath.row].constructor.name
    }
    
    public func getPoints(indexPath: IndexPath) -> String {
        return dataResults[0].results[indexPath.row].points
    }
    
    public var getWinnerPhoto: UIImage {
        if dataResults[0].results[0].driver.familyName == "Verstappen" {
            return UIImage(named: "max") ?? UIImage()
        } else if dataResults[0].results[0].driver.familyName == "Pérez" {
            return UIImage(named: "sergio") ?? UIImage()
        } else if dataResults[0].results[0].driver.familyName == "Stroll" {
            return UIImage(named: "lance") ?? UIImage()
        } else if dataResults[0].results[0].driver.familyName == "Sainz" {
            return UIImage(named: "carlos") ?? UIImage()
        } else if dataResults[0].results[0].driver.familyName == "Russell" {
            return UIImage(named: "george") ?? UIImage()
        } else if dataResults[0].results[0].driver.familyName == "Hamilton" {
            return UIImage(named: "lewis") ?? UIImage()
        } else if dataResults[0].results[0].driver.familyName == "Alonso" {
            return UIImage(named: "fernando") ?? UIImage()
        } else if dataResults[0].results[0].driver.familyName == "Ocon" {
            return UIImage(named: "esteban") ?? UIImage()
        } else if dataResults[0].results[0].driver.familyName == "Gasly" {
            return UIImage(named: "pierre") ?? UIImage()
        } else if dataResults[0].results[0].driver.familyName == "Norris" {
            return UIImage(named: "lando") ?? UIImage()
        } else if dataResults[0].results[0].driver.familyName == "Hülkenberg" {
            return UIImage(named: "nico") ?? UIImage()
        } else if dataResults[0].results[0].driver.familyName == "Piastri" {
            return UIImage(named: "oscar") ?? UIImage()
        } else if dataResults[0].results[0].driver.familyName == "Bottas" {
            return UIImage(named: "valteri") ?? UIImage()
        } else if dataResults[0].results[0].driver.familyName == "Zhou" {
            return UIImage(named: "guanyu") ?? UIImage()
        } else if dataResults[0].results[0].driver.familyName == "Tsunoda" {
            return UIImage(named: "yuki") ?? UIImage()
        } else if dataResults[0].results[0].driver.familyName == "Magnussen" {
            return UIImage(named: "kevin") ?? UIImage()
        } else if dataResults[0].results[0].driver.familyName == "Albon" {
            return UIImage(named: "alexander") ?? UIImage()
        } else if dataResults[0].results[0].driver.familyName == "de Vries" {
            return UIImage(named: "nyck") ?? UIImage()
        } else if dataResults[0].results[0].driver.familyName == "Sargeant" {
            return UIImage(named: "logan") ?? UIImage()
        } else if dataResults[0].results[0].driver.familyName == "Leclerc" {
            return UIImage(named: "charles") ?? UIImage()
        } else if dataResults[0].results[0].driver.familyName == "Ricciardo" {
            return UIImage(named: "ricciardo") ?? UIImage()
        }
        return UIImage()
    }
    
    public var countryLastEvent: UIImage {
        if dataResults[0].circuit.location.country == "Bahrain" {
            return UIImage(named: "bahrain") ?? UIImage()
        } else if dataResults[0].circuit.location.country == "Saudi Arabia" {
            return UIImage(named: "saudiarabia") ?? UIImage()
        } else if dataResults[0].circuit.location.country == "Australia" {
            return UIImage(named: "australia") ?? UIImage()
        } else if dataResults[0].circuit.location.country == "Azerbaijan" {
            return UIImage(named: "azerbaijan") ?? UIImage()
        } else if dataResults[0].circuit.location.country == "USA" || dataResults[0].circuit.location.country == "United States" {
            return UIImage(named: "us") ?? UIImage()
        } else if dataResults[0].circuit.location.country == "Monaco" {
            return UIImage(named: "monaco") ?? UIImage()
        } else if dataResults[0].circuit.location.country == "Spain" {
            return UIImage(named: "spain") ?? UIImage()
        } else if dataResults[0].circuit.location.country == "Canada" {
            return UIImage(named: "canada") ?? UIImage()
        } else if dataResults[0].circuit.location.country == "Austria" {
            return UIImage(named: "austria") ?? UIImage()
        } else if dataResults[0].circuit.location.country == "UK" {
            return UIImage(named: "uk") ?? UIImage()
        } else if dataResults[0].circuit.location.country == "Hungary" {
            return UIImage(named: "hungary") ?? UIImage()
        } else if dataResults[0].circuit.location.country == "Netherlands" {
            return UIImage(named: "netherland") ?? UIImage()
        } else if dataResults[0].circuit.location.country == "Belgium" {
            return UIImage(named: "belgium") ?? UIImage()
        } else if dataResults[0].circuit.location.country == "Italy" {
            return UIImage(named: "italy") ?? UIImage()
        } else if dataResults[0].circuit.location.country == "Singapore" {
            return UIImage(named: "singapore") ?? UIImage()
        } else if dataResults[0].circuit.location.country == "Japan" {
            return UIImage(named: "japan") ?? UIImage()
        } else if dataResults[0].circuit.location.country == "Qatar" {
            return UIImage(named: "qatar") ?? UIImage()
        } else if dataResults[0].circuit.location.country == "Mexico" {
            return UIImage(named: "mexico") ?? UIImage()
        } else if dataResults[0].circuit.location.country == "Brazil" {
            return UIImage(named: "brazil") ?? UIImage()
        } else if dataResults[0].circuit.location.country == "UAE" {
            return UIImage(named: "abudhabi") ?? UIImage()
        }
        return UIImage()
    }
    
    public var driverFirstPlace: String {
        return dataResults[0].results[0].driver.familyName
    }
    
    public func getNumberFirstPlace() -> String {
        var nFirstPlace = 0
        for firstPlace in 0..<dataDriver.count {
            if dataDriver[firstPlace].results[0].position == "1" {
                nFirstPlace += 1
            }
        }
        return String(nFirstPlace)
    }
    
    public func getNumberSecondPlace() -> String {
        var nSecondPlace = 0
        for secondPlace in 0..<dataDriver.count {
            if dataDriver[secondPlace].results[0].position  == "2" {
                nSecondPlace += 1
            }
        }
        return String(nSecondPlace)
    }
    
    public func getNumberThirdPlace() -> String {
        var nThirdPlace = 0
        for thirdPlace in 0..<dataDriver.count {
            if dataDriver[thirdPlace].results[0].position == "3" {
                nThirdPlace += 1
            }
        }
        return String(nThirdPlace)
    }
}
