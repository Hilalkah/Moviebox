//
//  MovieListViewModel.swift
//  Moviebox
//
//  Created by Hilal Kahraman on 4.02.2026.
//

import Foundation

final class MovieListViewModel: MovieListViewModelProtocol {
    
    weak var delegate: MovieListViewModelDelegate?
    private let service: NetworkManagerProtocol
    private var movies: [Movie] = []
    
    init(service: NetworkManagerProtocol) {
        self.service = service
    }
    
    func load() async {
        notify(.updateTitle("Movies"))
        notify(.setLoading(true))
        
        defer { notify(.setLoading(false)) }
        do {
            let movieRequest = TopMoviesRequestModel()
            let response = try await service.fetch(with: movieRequest)
            movies = response.results
            let presentations = response.results.map({ MoviePresentation(movie: $0)})
            notify(.showMovieList(presentations))
            
        } catch {
            print(error)
        }
    }
    
    func selectMovie(at index: Int) {
        guard movies.indices.contains(index) else { return }
        let movie = movies[index]
        let viewModel = MovieDetailViewModel(movie: movie)
        delegate?.navigate(to: .detail(viewModel))
    }
    
    private func notify(_ output: MovieListViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}
