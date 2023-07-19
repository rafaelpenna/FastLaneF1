//
//  EventModel.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 18/07/23.
//

import Foundation
import UIKit


struct EventModel: Codable {
    let mrData: MRDataStandingsModel

    enum CodingKeys: String, CodingKey {
        case mrData = "MRData"
    }
}

struct MRDataStandingsModel: Codable {
    let xmlns: String
    let series: String
    let url: String
    let limit, offset, total: String
    let raceTable: RaceTableStandingsModel

    enum CodingKeys: String, CodingKey {
        case xmlns, series, url, limit, offset, total
        case raceTable = "RaceTable"
    }
}

struct RaceTableStandingsModel: Codable {
    let season, round: String
    let races: [RaceStandingsModel]

    enum CodingKeys: String, CodingKey {
        case season, round
        case races = "Races"
    }
}

struct RaceStandingsModel: Codable {
    let season, round: String
    let url: String
    let raceName: String
    let circuit: CircuitStandingsModel
    let date, time: String
    let results: [ResultStandingsModel]

    enum CodingKeys: String, CodingKey {
        case season, round, url, raceName
        case circuit = "Circuit"
        case date, time
        case results = "Results"
    }
}

struct CircuitStandingsModel: Codable {
    let circuitID: String
    let url: String
    let circuitName: String
    let location: LocationStandingsModel

    enum CodingKeys: String, CodingKey {
        case circuitID = "circuitId"
        case url, circuitName
        case location = "Location"
    }
}

struct LocationStandingsModel: Codable {
    let lat, long, locality, country: String
}

struct ResultStandingsModel: Codable {
    let number, position, positionText, points: String
    let driver: DriverStandingsModel
    let constructor: ConstructorStandingsModel
    let grid, laps, status: String
    let time: ResultTimeStandingsModel?
    let fastestLap: FastestLapStandingsModel

    enum CodingKeys: String, CodingKey {
        case number, position, positionText, points
        case driver = "Driver"
        case constructor = "Constructor"
        case grid, laps, status
        case time = "Time"
        case fastestLap = "FastestLap"
    }
}

struct ConstructorStandingsModel: Codable {
    let constructorID: String
    let url: String
    let name, nationality: String

    enum CodingKeys: String, CodingKey {
        case constructorID = "constructorId"
        case url, name, nationality
    }
}

struct DriverStandingsModel: Codable {
    let driverID, permanentNumber, code: String
    let url: String
    let givenName, familyName, dateOfBirth, nationality: String

    enum CodingKeys: String, CodingKey {
        case driverID = "driverId"
        case permanentNumber, code, url, givenName, familyName, dateOfBirth, nationality
    }
}

struct FastestLapStandingsModel: Codable {
    let rank, lap: String
    let time: FastestLapTimeStandingsModel
    let averageSpeed: AverageSpeedStandingsModel

    enum CodingKeys: String, CodingKey {
        case rank, lap
        case time = "Time"
        case averageSpeed = "AverageSpeed"
    }
}

struct AverageSpeedStandingsModel: Codable {
    let units: Units
    let speed: String
}

enum Units: String, Codable {
    case kph = "kph"
}

struct FastestLapTimeStandingsModel: Codable {
    let time: String
}

struct ResultTimeStandingsModel: Codable {
    let millis, time: String
}


// MARK: - CircuitModel
struct CircuitModel: Codable {
    let mrData: MRDataCircuitModel

    enum CodingKeys: String, CodingKey {
        case mrData = "MRData"
    }
}

struct MRDataCircuitModel: Codable {
    let xmlns: String
    let series: String
    let url: String
    let limit, offset, total: String
    let circuitTable: CircuitTableCircuitModel

    enum CodingKeys: String, CodingKey {
        case xmlns, series, url, limit, offset, total
        case circuitTable = "CircuitTable"
    }
}

struct CircuitTableCircuitModel: Codable {
    let season: String
    let circuits: [CircuitCircuitModel]

    enum CodingKeys: String, CodingKey {
        case season
        case circuits = "Circuits"
    }
}

struct CircuitCircuitModel: Codable {
    let round, circuitID: String
    let url: String
    let circuitName: String
    let circuitInfo: CircuitInfoCircuitModel
    let circuitLapRecord: CircuitLapRecordCircuitModel

    enum CodingKeys: String, CodingKey {
        case round
        case circuitID = "circuitId"
        case url, circuitName
        case circuitInfo = "CircuitInfo"
        case circuitLapRecord = "CircuitLapRecord"
    }
}

struct CircuitInfoCircuitModel: Codable {
    let circuitLayoutImage, numberLaps, lenght, raceDistance: String
    let firstGrandPrix, locality, country: String
}

struct CircuitLapRecordCircuitModel: Codable {
    let lapRecordNameDriver, lapRecordTime, lapRecordYear: String
}

