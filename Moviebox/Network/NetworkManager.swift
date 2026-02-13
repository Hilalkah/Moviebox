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
    
    func fetch<T: BaseRequest>(with requestModel: T) async throws -> T.responseModel {
        
        var urlComponents = URLComponents(url: requestModel.baseUrl, resolvingAgainstBaseURL: false)
        urlComponents?.path = requestModel.path
        urlComponents?.queryItems = requestModel.urlQueryItems
        
        guard let url = urlComponents?.url else {
            throw URLError(.badURL)
        }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let response = response as? HTTPURLResponse,
              (200..<299).contains(response.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        return try Decoders.dateDecoder.decode(T.responseModel.self, from: data)
    }
}
