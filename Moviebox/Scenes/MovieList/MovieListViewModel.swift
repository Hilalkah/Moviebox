//
//  MovieListViewModel.swift
//  Moviebox
//
//  Created by Hilal Kahraman on 4.02.2026.
//

import Foundation

final class MovieListViewModel: MovieListViewModelProtocol {
    
    weak var delegate: MovieListViewModelDelegate?
    private let service: TopMoviesServiceProtocol
    
    init(service: TopMoviesServiceProtocol) {
        self.service = service
    }
    
    func load() {
        notify(.updateTitle("Movies"))
        notify(.setLoading(true))
        
        service.fetchTopMovies { [weak self] (result) in
            guard let self else { return }
            self.notify(.setLoading(false))
            
            switch result {
            case .success(let response):
                let movies = response.results
                let presentations = movies.map({ MoviePresentation(movie: $0)})
                self.notify(.showMovieList(presentations))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func selectMovie(at index: Int) {
        // TODO: Implement
    }
    
    private func notify(_ output: MovieListViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}
