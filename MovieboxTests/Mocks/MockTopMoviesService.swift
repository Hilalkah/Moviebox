//
//  MockTopMoviesService.swift
//  Moviebox
//
//  Created by Hilal Kahraman on 4.02.2026.
//

import Foundation

final class MockTopMoviesService: NetworkManagerProtocol {
    var movies: [Movie] = []
    
    func fetch<T: BaseRequest>(with requestModel: T) async throws -> T.responseModel {
        let data = TopMoviesResponseModel(results: movies)
        return data as! T.responseModel
    }
}
