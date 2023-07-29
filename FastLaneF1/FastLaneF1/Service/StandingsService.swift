//
//  StandingsService.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 18/07/23.
//


import UIKit

protocol StandingsServiceDelegate: GenericService {
    func getStandingsDataFromJson(fromFileName name: String, completion: completion<EventModel?>)
    func getStandingsData(fromURL url: String, completion: @escaping (Result<EventModel, Error>) -> Void)
}

class StandingsService: StandingsServiceDelegate {
    func getStandingsData(fromURL url: String, completion: @escaping (Result<EventModel, Error>) -> Void) {
        guard let url = URL(string: url) else {
            return completion(.failure(Error.errorUrl(urlString: url)))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error {
                    return completion(.failure(Error.errorURLRequest(error)))
                }
                
                guard let data = data else {
                    return completion(.failure(Error.errorDetail(detail: "Error Data")))
                }
                
                do {
                    let standing = try JSONDecoder().decode(EventModel.self, from: data)
                    completion(.success(standing))
                } catch {
                    completion(.failure(Error.errorURLRequest(error)))
                }
            }
        }.resume()
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
