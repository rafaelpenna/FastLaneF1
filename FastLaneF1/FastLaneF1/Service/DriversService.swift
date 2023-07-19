//
//  DriversService.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 19/07/23.
//

import UIKit
import Alamofire

protocol DriverServiceDelegate: GenericService {
    func getDriversDataFromJson(fromFileName name: String, completion: completion<DriversModel?>)
    func getDriversData(fromURL url: String, completion: @escaping completion<DriversModel?>)
}

class DriversService: DriverServiceDelegate {
    
    func getDriversData(fromURL url: String, completion: @escaping completion<DriversModel?>) {
        let url: String = url
        
        AF.request(url, method: .get).validate().responseDecodable(of: DriversModel.self) { response in
            switch response.result {
            case .success(let success):
                completion(success, nil)
            case .failure(let error):
                completion(nil, Error.errorRequest(error))
            }
        }
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



