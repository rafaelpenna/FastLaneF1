//
//  NextEventViewModel.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 07/08/23.
//

import Foundation
import UIKit

protocol NextEventViewModelProtocol: AnyObject {
    func nextEventReloadTableView()
}

protocol NextEventViewModelDelegate: AnyObject {
    func success()
    func error(_ message: String)
}

class NextEventViewModel {
    private let service: NextEventService = NextEventService()
    private weak var delegate: NextEventViewModelDelegate?
    private var dataEvent: [NextEventRace] = []
    
    public func delegate(delegate: NextEventViewModelDelegate?) {
        self.delegate = delegate
    }
    
    public func fetchNextEvent() {
        self.service.getNextEventData(fromURL: "https://ergast.com/api/f1/current/next.json") { result in
            DispatchQueue.main.async {
                switch result {
                case let .failure(error):
                    print(error)
                case let .success(dataEvent):
                    self.dataEvent = dataEvent.mrData.raceTable.races
                    self.delegate?.success()
                }
            }
        }
    }
    
    public var nameNextEvent: String {
        return dataEvent[0].raceName
    }
    
    public var circuitNameNextEvent: String {
        return dataEvent[0].circuit.circuitName
    }
    
    public var dateNextEvent: String {
        return dataEvent[0].date
    }
    
    
    public var countryNextEvent: UIImage {
        if dataEvent[0].circuit.location.country == "Bahrain" {
            return UIImage(named: "bahrain") ?? UIImage()
        } else if dataEvent[0].circuit.location.country == "Saudi Arabia" {
            return UIImage(named: "saudiarabia") ?? UIImage()
        } else if dataEvent[0].circuit.location.country == "Australia" {
            return UIImage(named: "australia") ?? UIImage()
        } else if dataEvent[0].circuit.location.country == "Azerbaijan" {
            return UIImage(named: "azerbaijan") ?? UIImage()
        } else if dataEvent[0].circuit.location.country == "USA" || dataEvent[0].circuit.location.country == "United States" {
            return UIImage(named: "us") ?? UIImage()
        } else if dataEvent[0].circuit.location.country == "Monaco" {
            return UIImage(named: "monaco") ?? UIImage()
        } else if dataEvent[0].circuit.location.country == "Spain" {
            return UIImage(named: "spain") ?? UIImage()
        } else if dataEvent[0].circuit.location.country == "Canada" {
            return UIImage(named: "canada") ?? UIImage()
        } else if dataEvent[0].circuit.location.country == "Austria" {
            return UIImage(named: "austria") ?? UIImage()
        } else if dataEvent[0].circuit.location.country == "UK" {
            return UIImage(named: "uk") ?? UIImage()
        } else if dataEvent[0].circuit.location.country == "Hungary" {
            return UIImage(named: "hungary") ?? UIImage()
        } else if dataEvent[0].circuit.location.country == "Netherlands" {
            return UIImage(named: "netherland") ?? UIImage()
        } else if dataEvent[0].circuit.location.country == "Belgium" {
            return UIImage(named: "belgium") ?? UIImage()
        } else if dataEvent[0].circuit.location.country == "Italy" {
            return UIImage(named: "italy") ?? UIImage()
        } else if dataEvent[0].circuit.location.country == "Singapore" {
            return UIImage(named: "singapore") ?? UIImage()
        } else if dataEvent[0].circuit.location.country == "Japan" {
            return UIImage(named: "japan") ?? UIImage()
        } else if dataEvent[0].circuit.location.country == "Qatar" {
            return UIImage(named: "qatar") ?? UIImage()
        } else if dataEvent[0].circuit.location.country == "Mexico" {
            return UIImage(named: "mexico") ?? UIImage()
        } else if dataEvent[0].circuit.location.country == "Brazil" {
            return UIImage(named: "brazil") ?? UIImage()
        } else if dataEvent[0].circuit.location.country == "UAE" {
            return UIImage(named: "abudhabi") ?? UIImage()
        }
        return UIImage()
    }
}
