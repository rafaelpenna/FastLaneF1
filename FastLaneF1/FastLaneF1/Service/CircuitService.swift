//
//  CircuitService.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 18/07/23.
//

import UIKit
import Alamofire

protocol CircuitServiceDelegate: GenericService {
    func getCircuitDataFromJson(fromFileName name: String, completion: completion<CircuitModel?>)
    func getCircuitData(fromURL url: String, completion: @escaping completion<CircuitModel?>)
}

class CircuitService: CircuitServiceDelegate {
    func getCircuitData(fromURL url: String, completion: @escaping completion<CircuitModel?>) {
        let url: String = url
        
        AF.request(url, method: .get).validate().responseDecodable(of: CircuitModel.self) { response in
            switch response.result {
            case .success(let success):
                completion(success, nil)
            case .failure(let error):
                completion(nil, Error.errorRequest(error))
            }
        }
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
