//
//  DriversDetailModel.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 21/07/23.
//

import Foundation

struct DriversDetailModel: Codable {
    let mrData: DriversDetailMRData

    enum CodingKeys: String, CodingKey {
        case mrData = "MRData"
    }
}

struct DriversDetailMRData: Codable {
    let xmlns: String
    let series: String
    let url: String
    let limit, offset, total: String
    let raceTable: DriversDetailRaceTable

    enum CodingKeys: String, CodingKey {
        case xmlns, series, url, limit, offset, total
        case raceTable = "RaceTable"
    }
}

struct DriversDetailRaceTable: Codable {
    let season: String
    let driverID: DriverID
    let races: [DriverDetailRace]

    enum CodingKeys: String, CodingKey {
        case season
        case driverID = "driverId"
        case races = "Races"
    }
}

enum DriverID: String, Codable {
    case alonso = "alonso"
}

struct DriverDetailRace: Codable {
    let season, round: String
    let url: String
    let raceName: String
    let circuit: DriversDetailCircuit
    let date, time: String
    let results: [DriversDetailResult]

    enum CodingKeys: String, CodingKey {
        case season, round, url, raceName
        case circuit = "Circuit"
        case date, time
        case results = "Results"
    }
}

struct DriversDetailCircuit: Codable {
    let circuitID: String
    let url: String
    let circuitName: String
    let location: DriversDetailLocation

    enum CodingKeys: String, CodingKey {
        case circuitID = "circuitId"
        case url, circuitName
        case location = "Location"
    }
}

struct DriversDetailLocation: Codable {
    let lat, long, locality, country: String
}

struct DriversDetailResult: Codable {
    let number, position, positionText, points: String

    enum CodingKeys: String, CodingKey {
        case number, position, positionText, points
    }
}



