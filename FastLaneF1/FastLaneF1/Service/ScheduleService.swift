//
//  ScheduleService.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 18/07/23.
//

import UIKit
import Alamofire

protocol ScheduleServiceDelegate: GenericService {
    func getScheduleDataFromJson(fromFileName name: String, completion: completion<ScheduleModel?>)
    func getScheduleData(fromURL url: String, completion: @escaping completion<ScheduleModel?>)
}

class ScheduleService: ScheduleServiceDelegate {
    func getScheduleData(fromURL url: String, completion: @escaping completion<ScheduleModel?>) {
        let url: String = url
        
        AF.request(url, method: .get).validate().responseDecodable(of: ScheduleModel.self) { response in
            switch response.result {
            case .success(let success):
                completion(success, nil)
            case .failure(let error):
                completion(nil, Error.errorRequest(error))
            }
        }
    }
    
    func getScheduleData(fromURL url: String, completion: @escaping (Result<ScheduleModel, Error>) -> Void) {
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
                    let person = try JSONDecoder().decode(ScheduleModel.self, from: data)
                    completion(.success(person))
                } catch {
                    completion(.failure(Error.errorURLRequest(error)))
                }
            }
        }.resume()
    }
    
    func getScheduleDataFromJson(fromFileName name: String, completion: completion<ScheduleModel?>) {
        if let name = Bundle.main.url(forResource: name, withExtension: "json"){
            do {
                let data = try Data(contentsOf: name)
                let listRaces = try JSONDecoder().decode(ScheduleModel.self, from: data)
                completion(listRaces, nil)
            } catch {
                completion(nil, Error.fileDecodingFailed(name: "seasonRaces", error))
            }
        }
    }
}

