//
//  StandingsService.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 18/07/23.
//


import UIKit
import Alamofire

protocol StandingsServiceDelegate: GenericService {
    func getStandingsDataFromJson(fromFileName name: String, completion: completion<EventModel?>)
    func getStandingsData(fromURL url: String, completion: @escaping completion<EventModel?>)
}

class StandingsService: StandingsServiceDelegate {
    func getStandingsData(fromURL url: String, completion: @escaping completion<EventModel?>) {
        let url: String = url
        
        AF.request(url, method: .get).validate().responseDecodable(of: EventModel.self) { response in
            switch response.result {
            case .success(let success):
                completion(success, nil)
            case .failure(let error):
                completion(nil, Error.errorRequest(error))
            }
        }
    }
    
    func getStandingsDataFromJson(fromFileName name: String, completion: completion<EventModel?>) {
        if let name = Bundle.main.url(forResource: name, withExtension: "json"){
            do {
                let data = try Data(contentsOf: name)
                let listStandings = try JSONDecoder().decode(EventModel.self, from: data)
                completion(listStandings, nil)
            } catch {
                completion(nil, Error.fileDecodingFailed(name: "standingsRound1", error))
            }
        }
    }
}
