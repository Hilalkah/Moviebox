//
//  MovieListViewModel.swift
//  Moviebox
//
//  Created by Hilal Kahraman on 4.02.2026.
//

import Foundation

final class MovieListViewModel: MovieListViewModelProtocol {
    
    weak var delegate: MovieListViewModelDelegate?
    
    func load() {
        delegate?.handleViewModelOutput(.updateTitle("Movies"))
    }
    
    func selectMovie(at index: Int) {
        // TODO: Implement
    }
}
