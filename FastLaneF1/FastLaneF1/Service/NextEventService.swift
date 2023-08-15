//
//  NextEventService.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 07/08/23.
//

import Foundation
import UIKit

protocol NextEventServiceDelegate: GenericService {
    func getNextEventData(fromURL url: String, completion: @escaping (Result<NextEventModel, Error>) -> Void)
}

class NextEventService: NextEventServiceDelegate {
    func getNextEventData(fromURL url: String, completion: @escaping (Result<NextEventModel, Error>) -> Void) {
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
                    let nextEvent = try JSONDecoder().decode(NextEventModel.self, from: data)
                    completion(.success(nextEvent))
                } catch {
                    completion(.failure(Error.errorURLRequest(error)))
                }
            }
        }.resume()
    }
}
