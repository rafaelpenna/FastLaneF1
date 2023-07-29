//
//  CircuitService.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 18/07/23.
//

import UIKit

protocol CircuitServiceDelegate: GenericService {
    func getCircuitDataFromJson(fromFileName name: String, completion: completion<CircuitModel?>)
    func getCircuitData(fromURL url: String, completion: @escaping (Result<CircuitModel, Error>) -> Void)
}

class CircuitService: CircuitServiceDelegate {
    func getCircuitData(fromURL url: String, completion: @escaping (Result<CircuitModel, Error>) -> Void) {
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
                    let standing = try JSONDecoder().decode(CircuitModel.self, from: data)
                    completion(.success(standing))
                } catch {
                    completion(.failure(Error.errorURLRequest(error)))
                }
            }
        }.resume()
    }
    
    func getCircuitDataFromJson(fromFileName name: String, completion: completion<CircuitModel?>) {
        if let name = Bundle.main.url(forResource: name, withExtension: "json"){
            do {
                let data = try Data(contentsOf: name)
                let listCircuits = try JSONDecoder().decode(CircuitModel.self, from: data)
                completion(listCircuits, nil)
            } catch {
                completion(nil, Error.fileDecodingFailed(name: "seasonCircuitInfo", error))
            }
        }
    }
}
