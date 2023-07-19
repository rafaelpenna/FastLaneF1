//
//  ConstructorService.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 19/07/23.
//

import UIKit
import Alamofire

protocol ConstrcutorServiceDelegate: GenericService {
    func getConstructorDataFromJson(fromFileName name: String, completion: completion<ConstructorModel?>)
    func getConstructorData(fromURL url: String, completion: @escaping completion<ConstructorModel?>)
}

class ConstrcutorService: ConstrcutorServiceDelegate {
    func getConstructorData(fromURL url: String, completion: @escaping completion<ConstructorModel?>) {
        let url: String = url
        
        AF.request(url, method: .get).validate().responseDecodable(of: ConstructorModel.self) { response in
            switch response.result {
            case .success(let success):
                completion(success, nil)
            case .failure(let error):
                completion(nil, Error.errorRequest(error))
            }
        }
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
