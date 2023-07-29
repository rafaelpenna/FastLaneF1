//
//  ConstructorService.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 19/07/23.
//

import UIKit

protocol ConstrcutorServiceDelegate: GenericService {
    func getConstructorDataFromJson(fromFileName name: String, completion: completion<ConstructorModel?>)
    func getConstructorData(fromURL url: String, completion: @escaping (Result<ConstructorModel, Error>) -> Void)
}

class ConstrcutorService: ConstrcutorServiceDelegate {
    func getConstructorData(fromURL url: String, completion: @escaping (Result<ConstructorModel, Error>) -> Void) {
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
                    let constructor = try JSONDecoder().decode(ConstructorModel.self, from: data)
                    completion(.success(constructor))
                } catch {
                    completion(.failure(Error.errorURLRequest(error)))
                }
            }
        }.resume()
    }
    
    func getConstructorDataFromJson(fromFileName name: String, completion: completion<ConstructorModel?>) {
        if let name = Bundle.main.url(forResource: name, withExtension: "json"){
            do {
                let data = try Data(contentsOf: name)
                let listTeams = try JSONDecoder().decode(ConstructorModel.self, from: data)
                completion(listTeams, nil)
            } catch {
                completion(nil, Error.fileDecodingFailed(name: "seasonConstructors", error))
            }
        }
    }
}
