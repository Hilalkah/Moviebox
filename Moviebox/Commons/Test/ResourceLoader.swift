//
//  ResourceLoader.swift
//  Moviebox
//
//  Created by Hilal Kahraman on 4.02.2026.
//

import Foundation

class ResourceLoader {
    
    enum MovieResource: String {
        case movie1
        case movie2
        case movie3
    }
    
    static func loadMovie(resource: MovieResource) throws -> Movie {
        let bundle = Bundle.test
        let url = try bundle.url(forResource: resource.rawValue, withExtension: "json").unwrap()
        let data = try Data(contentsOf: url)
        let decoder = Decoders.plainDateDecoder
        let movie = try decoder.decode(Movie.self, from: data)
        return movie
    }
}

private extension Bundle {
    class Dummy { }
    static let test = Bundle(for: Dummy.self)
}
