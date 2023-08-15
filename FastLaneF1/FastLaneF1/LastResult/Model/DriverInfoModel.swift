
import Foundation

struct DriverInfoModel: Codable {
    let mrData: DriverInfoMRData

    enum CodingKeys: String, CodingKey {
        case mrData = "MRData"
    }
}

struct DriverInfoMRData: Codable {
    let xmlns: String
    let series: String
    let url: String
    let limit, offset, total: String
    let raceTable: DriverInfoRaceTable

    enum CodingKeys: String, CodingKey {
        case xmlns, series, url, limit, offset, total
        case raceTable = "RaceTable"
    }
}

struct DriverInfoRaceTable: Codable {
    let season: String
    let races: [DriverInfoRace]

    enum CodingKeys: String, CodingKey {
        case season
        case races = "Races"
    }
}

struct DriverInfoRace: Codable {
    let season, round: String
    let url: String
    let raceName: String
    let circuit: DriverInfoCircuit
    let date, time: String
    let results: [DriverInfoResult]

    enum CodingKeys: String, CodingKey {
        case season, round, url, raceName
        case circuit = "Circuit"
        case date, time
        case results = "Results"
    }
}

struct DriverInfoCircuit: Codable {
    let circuitID: String
    let url: String
    let circuitName: String
    let location: DriverInfoLocation

    enum CodingKeys: String, CodingKey {
        case circuitID = "circuitId"
        case url, circuitName
        case location = "Location"
    }
}

struct DriverInfoLocation: Codable {
    let lat, long, locality, country: String
}

struct DriverInfoResult: Codable {
    let number, position, positionText, points: String
    let driver: DriverInfoDriver
    let constructor: DriverInfoConstructor
    let grid, laps: String
    let status: String
    let fastestLap: FastestLap

    enum CodingKeys: String, CodingKey {
        case number, position, positionText, points
        case driver = "Driver"
        case constructor = "Constructor"
        case grid, laps, status
        case fastestLap = "FastestLap"
    }
}

struct DriverInfoConstructor: Codable {
    let url: String
    let name: String
    let nationality: String

    enum CodingKeys: String, CodingKey {
        case url, name, nationality
    }
}

struct DriverInfoDriver: Codable {
    let permanentNumber: String
    let code: String
    let url: String
    let givenName: String
    let familyName: String
    let dateOfBirth: String
    let nationality: String

    enum CodingKeys: String, CodingKey {
        case permanentNumber, code, url, givenName, familyName, dateOfBirth, nationality
    }
}

struct FastestLap: Codable {
    let rank, lap: String

    enum CodingKeys: String, CodingKey {
        case rank, lap
    }
}

struct DriverInfoAverageSpeed: Codable {
    let units: DriverInfoUnits
    let speed: String
}

enum DriverInfoUnits: String, Codable {
    case kph = "kph"
}

struct DriverInfoFastestLapTime: Codable {
    let time: String
}

enum Status: String, Codable {
    case finished = "Finished"
}


