//
//  MockTopMoviesService.swift
//  Moviebox
//
//  Created by Hilal Kahraman on 4.02.2026.
//

import Foundation

final class MockTopMoviesService: TopMoviesServiceProtocol {
    
    var movies: [Movie] = []
    
    func fetchTopMovies(completion: @escaping (Result<TopMoviesResponse>) -> Void) {
        completion(.success(TopMoviesResponse(results: movies)))
    }
}
