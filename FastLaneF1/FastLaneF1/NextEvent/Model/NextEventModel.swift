//
//  NextEventModel.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 07/08/23.
//

import Foundation

struct NextEventModel: Codable {
    let mrData: NextEventMRData

    enum CodingKeys: String, CodingKey {
        case mrData = "MRData"
    }
}

struct NextEventMRData: Codable {
    let xmlns: String
    let series: String
    let url: String
    let limit, offset, total: String
    let raceTable: NextEventRaceTable

    enum CodingKeys: String, CodingKey {
        case xmlns, series, url, limit, offset, total
        case raceTable = "RaceTable"
    }
}

struct NextEventRaceTable: Codable {
    let season, round: String
    let races: [NextEventRace]

    enum CodingKeys: String, CodingKey {
        case season, round
        case races = "Races"
    }
}

struct NextEventRace: Codable {
    let season, round: String
    let url: String
    let raceName: String
    let circuit: NextEventCircuit
    let date, time: String
    let firstPractice, secondPractice, thirdPractice, qualifying: NextEventFirstPractice

    enum CodingKeys: String, CodingKey {
        case season, round, url, raceName
        case circuit = "Circuit"
        case date, time
        case firstPractice = "FirstPractice"
        case secondPractice = "SecondPractice"
        case thirdPractice = "ThirdPractice"
        case qualifying = "Qualifying"
    }
}

struct NextEventCircuit: Codable {
    let circuitID: String
    let url: String
    let circuitName: String
    let location: NextEventLocation

    enum CodingKeys: String, CodingKey {
        case circuitID = "circuitId"
        case url, circuitName
        case location = "Location"
    }
}

struct NextEventLocation: Codable {
    let lat, long, locality, country: String
}

struct NextEventFirstPractice: Codable {
    let date, time: String
}
