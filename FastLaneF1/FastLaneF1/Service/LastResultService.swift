//
//  LastResultService.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 02/08/23.
//

import Foundation
import UIKit

protocol LastResultServiceDelegate: GenericService {
    func getLastResultDataFromJson(fromFileName name: String, completion: completion<LastResultModel?>)
    func getLastResultData(fromURL url: String, completion: @escaping (Result<LastResultModel, Error>) -> Void)
}

class LastResultService: LastResultServiceDelegate {
    func getLastResultData(fromURL url: String, completion: @escaping (Result<LastResultModel, Error>) -> Void) {
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
                    let lastResult = try JSONDecoder().decode(LastResultModel.self, from: data)
                    completion(.success(lastResult))
                } catch {
                    completion(.failure(Error.errorURLRequest(error)))
                }
            }
        }.resume()
    }
    
    func getLastResultDataFromJson(fromFileName name: String, completion: completion<LastResultModel?>) {
        if let name = Bundle.main.url(forResource: name, withExtension: "json"){
            do {
                let data = try Data(contentsOf: name)
                let listStandings = try JSONDecoder().decode(LastResultModel.self, from: data)
                completion(listStandings, nil)
            } catch {
                completion(nil, Error.fileDecodingFailed(name: "standingsRound1", error))
            }
        }
    }
}
