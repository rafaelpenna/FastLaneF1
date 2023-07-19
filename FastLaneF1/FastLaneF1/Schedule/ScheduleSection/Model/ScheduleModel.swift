//
//  ScheduleModel.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 18/07/23.
//

import Foundation


struct ScheduleModel: Codable {
    let mrData: MRDataScheduleModel

    enum CodingKeys: String, CodingKey {
        case mrData = "MRData"
    }
}

struct MRDataScheduleModel: Codable {
    let xmlns: String
    let series: String
    let url: String
    let limit, offset, total: String
    let raceTable: RaceTableScheduleModel

    enum CodingKeys: String, CodingKey {
        case xmlns, series, url, limit, offset, total
        case raceTable = "RaceTable"
    }
}

struct RaceTableScheduleModel: Codable {
    let season: String
    let races: [RaceScheduleModel]

    enum CodingKeys: String, CodingKey {
        case season
        case races = "Races"
    }
}

struct RaceScheduleModel: Codable {
    let season, round: String
    let url: String
    let raceName: String
    let circuit: CircuitScheduleModel
    let date, time: String
    let firstPractice, secondPractice: FirstPracticeScheduleModel
    let thirdPractice: FirstPracticeScheduleModel?
    let qualifying: FirstPracticeScheduleModel
    let sprint: FirstPracticeScheduleModel?

    enum CodingKeys: String, CodingKey {
        case season, round, url, raceName
        case circuit = "Circuit"
        case date, time
        case firstPractice = "FirstPractice"
        case secondPractice = "SecondPractice"
        case thirdPractice = "ThirdPractice"
        case qualifying = "Qualifying"
        case sprint = "Sprint"
    }
}

struct CircuitScheduleModel: Codable {
    let circuitID: String
    let url: String
    let circuitName: String
    let location: LocationScheduleModel

    enum CodingKeys: String, CodingKey {
        case circuitID = "circuitId"
        case url, circuitName
        case location = "Location"
    }
}

struct LocationScheduleModel: Codable {
    let lat, long, locality, country: String
}

struct FirstPracticeScheduleModel: Codable {
    let date, time: String
}


