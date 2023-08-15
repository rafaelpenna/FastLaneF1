//
//  DriverInfoService.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 08/08/23.
//

import Foundation

import Foundation
import UIKit

protocol DriverInfoServiceDelegate: GenericService {
    func getDriverInfoDataFromJson(fromFileName name: String, completion: completion<DriverInfoModel?>)
    func getDriverInfoData(fromURL url: String, completion: @escaping (Result<DriverInfoModel, Error>) -> Void)
}

class DriverInfoService: DriverInfoServiceDelegate {
    func getDriverInfoData(fromURL url: String, completion: @escaping (Result<DriverInfoModel, Error>) -> Void) {
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
                    let driverInfo = try JSONDecoder().decode(DriverInfoModel.self, from: data)
                    completion(.success(driverInfo))
                } catch {
                    completion(.failure(Error.errorURLRequest(error)))
                }
            }
        }.resume()
    }
    
    func getDriverInfoDataFromJson(fromFileName name: String, completion: completion<DriverInfoModel?>) {
        if let name = Bundle.main.url(forResource: name, withExtension: "json"){
            do {
                let data = try Data(contentsOf: name)
                let driverInfo = try JSONDecoder().decode(DriverInfoModel.self, from: data)
                completion(driverInfo, nil)
            } catch {
                completion(nil, Error.fileDecodingFailed(name: "standingsRound1", error))
            }
        }
    }
}
