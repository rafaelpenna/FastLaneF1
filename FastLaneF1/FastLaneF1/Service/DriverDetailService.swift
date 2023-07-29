//
//  DriverDetailService.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 21/07/23.
//

import UIKit

protocol DriverDetailServiceDelegate: GenericService {
    func getDriversDetailDataFromJson(fromFileName name: String, completion: completion<DriversDetailModel?>)
    func getDriversDetailData(fromURL url: String, completion: @escaping (Result<DriversDetailModel, Error>) -> Void)
}

class DriversDetailService: DriverDetailServiceDelegate {
    func getDriversDetailData(fromURL url: String, completion: @escaping (Result<DriversDetailModel, Error>) -> Void) {
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
                    let standing = try JSONDecoder().decode(DriversDetailModel.self, from: data)
                    completion(.success(standing))
                } catch {
                    completion(.failure(Error.errorURLRequest(error)))
                }
            }
        }.resume()
    }
    
    func getDriversDetailDataFromJson(fromFileName name: String, completion: completion<DriversDetailModel?>) {
        if let name = Bundle.main.url(forResource: name, withExtension: "json"){
            do {
                let data = try Data(contentsOf: name)
                let listDriversDetail = try JSONDecoder().decode(DriversDetailModel.self, from: data)
                completion(listDriversDetail, nil)
            } catch {
                completion(nil, Error.fileDecodingFailed(name: "seasonDrivers", error))
            }
        }
    }
}



