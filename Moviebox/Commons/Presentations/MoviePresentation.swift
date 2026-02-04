//
//  MoviePresentation.swift
//  Moviebox
//
//  Created by Hilal Kahraman on 4.02.2026.
//

import Foundation

final class MoviePresentation: NSObject {
    
    let title: String
    let detail: String
    
    init(title: String, detail: String) {
        self.title = title
        self.detail = detail
        super.init()
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let other = object as? MoviePresentation else { return false }
        return self.title == other.title && self.detail == other.detail
    }
}

extension MoviePresentation {
    
    convenience init(movie: Movie) {
        self.init(title: movie.title, detail: movie.overview)
    }
}
