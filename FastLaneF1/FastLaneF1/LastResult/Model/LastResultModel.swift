//
//  LastResultModel.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 02/08/23.
//

import Foundation

struct LastResultModel: Codable {
    let mrData: LastResultMRData

    enum CodingKeys: String, CodingKey {
        case mrData = "MRData"
    }
}

struct LastResultMRData: Codable {
    let xmlns: String
    let series: String
    let url: String
    let limit, offset, total: String
    let raceTable: LastResultRaceTable

    enum CodingKeys: String, CodingKey {
        case xmlns, series, url, limit, offset, total
        case raceTable = "RaceTable"
    }
}

struct LastResultRaceTable: Codable {
    let season, round: String
    let races: [LastResultRace]

    enum CodingKeys: String, CodingKey {
        case season, round
        case races = "Races"
    }
}

struct LastResultRace: Codable {
    let season, round: String
    let url: String
    let raceName: String
    let circuit: LastResultCircuit
    let date, time: String
    let results: [LastResult]

    enum CodingKeys: String, CodingKey {
        case season, round, url, raceName
        case circuit = "Circuit"
        case date, time
        case results = "Results"
    }
}

struct LastResultCircuit: Codable {
    let circuitID: String
    let url: String
    let circuitName: String
    let location: LastResultLocation

    enum CodingKeys: String, CodingKey {
        case circuitID = "circuitId"
        case url, circuitName
        case location = "Location"
    }
}

struct LastResultLocation: Codable {
    let lat, long, locality, country: String
}

struct LastResult: Codable {
    let number, position, positionText, points: String
    let driver: LastResultDriver
    let constructor: LastResultConstructor
    let grid, laps: String
    let status: LastResultStatus

    enum CodingKeys: String, CodingKey {
        case number, position, positionText, points
        case driver = "Driver"
        case constructor = "Constructor"
        case grid, laps, status
    }
}

struct LastResultConstructor: Codable {
    let constructorID: String
    let url: String
    let name, nationality: String

    enum CodingKeys: String, CodingKey {
        case constructorID = "constructorId"
        case url, name, nationality
    }
}

struct LastResultDriver: Codable {
    let driverID, permanentNumber, code: String
    let url: String
    let givenName, familyName, dateOfBirth, nationality: String

    enum CodingKeys: String, CodingKey {
        case driverID = "driverId"
        case permanentNumber, code, url, givenName, familyName, dateOfBirth, nationality
    }
}



enum LastResultStatus: String, Codable {
    case collisionDamage = "Collision damage"
    case finished = "Finished"
}

