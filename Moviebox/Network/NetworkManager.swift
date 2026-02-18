//
//  NetworkManager.swift
//  Moviebox
//
//  Created by Hilal Kahraman on 13.02.2026.
//

import Foundation

protocol NetworkManagerProtocol {
    func fetch<T: BaseRequest>(with requestModel: T) async throws -> T.responseModel
}

final class NetworkManager: NetworkManagerProtocol {
    
    let urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func fetch<T: BaseRequest>(with requestModel: T) async throws -> T.responseModel {
        
        var urlComponents = URLComponents(url: requestModel.baseUrl, resolvingAgainstBaseURL: false)
        urlComponents?.path = requestModel.path
        urlComponents?.queryItems = requestModel.urlQueryItems
        
        guard let url = urlComponents?.url else {
            throw URLError(.badURL)
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = requestModel.httpMethod?.rawValue
        
        let (data, response) = try await urlSession.data(for: urlRequest)
        
        guard let response = response as? HTTPURLResponse,
              (200..<299).contains(response.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        return try Decoders.dateDecoder.decode(T.responseModel.self, from: data)
    }
}
