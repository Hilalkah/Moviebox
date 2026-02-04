//
//  MovieDetailViewModel.swift
//  Moviebox
//
//  Created by Hilal Kahraman on 4.02.2026.
//

import Foundation

final class MovieDetailViewModel: MovieDetailViewModelProtocol {
    
    weak var delegate: MovieDetailViewModelDelegate?
    private let presentation: MovieDetailPresentation
    
    init(movie: Movie) {
        self.presentation = MovieDetailPresentation(movie: movie)
    }
    
    func load() {
        delegate?.showDetail(presentation)
    }
}
