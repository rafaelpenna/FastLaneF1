//
//  DriversService.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 19/07/23.
//

import UIKit

protocol DriverServiceDelegate: GenericService {
    func getDriversDataFromJson(fromFileName name: String, completion: completion<DriversModel?>)
    func getDriversData(fromURL url: String, completion: @escaping (Result<DriversModel, Error>) -> Void)
}

class DriversService: DriverServiceDelegate {
    func getDriversData(fromURL url: String, completion: @escaping (Result<DriversModel, Error>) -> Void) {
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
                    let driver = try JSONDecoder().decode(DriversModel.self, from: data)
                    completion(.success(driver))
                } catch {
                    completion(.failure(Error.errorURLRequest(error)))
                }
            }
        }.resume()
    }

    func getDriversDataFromJson(fromFileName name: String, completion: completion<DriversModel?>) {
        if let name = Bundle.main.url(forResource: name, withExtension: "json"){
            do {
                let data = try Data(contentsOf: name)
                let listDrivers = try JSONDecoder().decode(DriversModel.self, from: data)
                completion(listDrivers, nil)
            } catch {
                completion(nil, Error.fileDecodingFailed(name: "seasonDrivers", error))
            }
        }
    }
}



