//
//  ScheduleService.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 18/07/23.
//

import UIKit

protocol ScheduleServiceDelegate: GenericService {
    func getScheduleDataFromJson(fromFileName name: String, completion: completion<ScheduleModel?>)
    func getScheduleData(fromURL url: String, completion: @escaping (Result<ScheduleModel, Error>) -> Void)
}

class ScheduleService: ScheduleServiceDelegate {
    func getScheduleData(fromURL url: String, completion: @escaping (Result<ScheduleModel, Error>) -> Void) {
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
                    let schedule = try JSONDecoder().decode(ScheduleModel.self, from: data)
                    completion(.success(schedule))
                } catch {
                    completion(.failure(Error.errorURLRequest(error)))
                }
            }
        }.resume()
    }
    
    func getScheduleDataFromJson(fromFileName name: String, completion: completion<ScheduleModel?>) {
        if let name = Bundle.main.url(forResource: name, withExtension: "json"){
            do {
                let data = try Data(contentsOf: name)
                let listRaces = try JSONDecoder().decode(ScheduleModel.self, from: data)
                completion(listRaces, nil)
            } catch {
                completion(nil, Error.fileDecodingFailed(name: "seasonRaces", error))
            }
        }
    }
}

