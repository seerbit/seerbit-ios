//
//  NetworkManager.swift
//  SeerBit-SDK
//
//  Created by Princess on 25/04/2023.
//

import Foundation
import Combine

enum CustomHTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol ServiceProtocol {
    
    /// - Parameters:
    ///   - url: url for request
    ///   - method: methods for POST, GET, PUT and DELETE
    ///   - parameters: request body as dictionary
    /// - Returns: returns AnyPublisher with the data response
    func makeReques<T: Codable>(url :String,
                                method: CustomHTTPMethod,
                                parameters: [String: Any]?) -> AnyPublisher<T, Error>
}

class NetworkManager: ServiceProtocol {
    
    // Create a shared Instance
    static let _shared = NetworkManager()
    
    // Shared Function
    class func shared() -> NetworkManager {
        return _shared
    }
    
    func makeReques<T>(url: String,
                       method: CustomHTTPMethod, parameters: [String: Any]? = nil) -> AnyPublisher<T, Error> where T : Decodable, T : Encodable {

        guard var urlComponents = URLComponents(string:url) else {
            fatalError("invalid url")
        }
        
        urlComponents.queryItems = []
       
       

        
        /// Create a request
        var request = URLRequest(url:  urlComponents.url!,
                                 cachePolicy: .useProtocolCachePolicy,
                                 timeoutInterval:  10 )
        request.httpMethod = method.rawValue
        request.addValue("68826aea9005de7812429b7983838b06e2c7fffbb3d9487f33bc51c943a3a499",
                         forHTTPHeaderField: "Authorization")
        if let parameters = parameters {
            do {
              // convert parameters to Data and assign dictionary to httpBody of request
              request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            } catch let error {
              print(error.localizedDescription)
            }
        }
        
        /// Create a session
        return URLSession
            .shared
            .dataTaskPublisher(for: request)
            //.print()
            .map{ $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .map { $0 }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    private func header() -> [String: String] {
        return ["Content-Type" : "application/json",
                "Accept" : "application/json",
                "Authorization": "Bearer68826aea9005de7812429b7983838b06e2c7fffbb3d9487f33bc51c943a3a499"]
    }
}
