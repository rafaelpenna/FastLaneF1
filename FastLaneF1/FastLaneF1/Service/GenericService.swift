//
//  GenericService.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 17/07/23.
//

import Foundation
import Alamofire

protocol GenericService: AnyObject {
    typealias completion <T> = (_ result: T, _ failure: Error?) -> Void
}

enum Error: Swift.Error {
    case fileNotFound(name: String)
    case fileDecodingFailed(name: String, Swift.Error)
    case errorURLRequest(Swift.Error)
    case errorRequest(AFError)
    case errorUrl(urlString: String)
    case errorDetail(detail: String)
}
