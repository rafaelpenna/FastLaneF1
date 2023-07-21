//
//  DriverDetailService.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 21/07/23.
//

import UIKit
import Alamofire

protocol DriverDetailServiceDelegate: GenericService {
    func getDriversDetailDataFromJson(fromFileName name: String, completion: completion<DriversDetailModel?>)
    func getDriversDetailData(fromURL url: String, completion: @escaping completion<DriversDetailModel?>)
}

class DriversDetailService: DriverDetailServiceDelegate {
    
    func getDriversDetailData(fromURL url: String, completion: @escaping completion<DriversDetailModel?>) {
        let url: String = url
        
        AF.request(url, method: .get).validate().responseDecodable(of: DriversDetailModel.self) { response in
            switch response.result {
            case .success(let success):
                completion(success, nil)
            case .failure(let error):
                completion(nil, Error.errorRequest(error))
            }
        }
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



