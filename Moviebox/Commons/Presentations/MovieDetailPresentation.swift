//
//  MovieDetailPresentation.swift
//  Moviebox
//
//  Created by Hilal Kahraman on 4.02.2026.
//

import UIKit

struct MovieDetailPresentation: Equatable {
    let title: String
    let overview: String
}

extension MovieDetailPresentation {
    
    init(movie: Movie) {
        self.init(title: movie.title, overview: movie.overview)
    }
}
