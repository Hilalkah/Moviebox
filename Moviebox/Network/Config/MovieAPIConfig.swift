//
//  MovieAPIConfig.swift
//  Moviebox
//
//  Created by Hilal Kahraman on 13.02.2026.
//

import Foundation

enum MovieAPIConfig {
    static let baseURL = URL(string: "https://api.themoviedb.org")
    static let apiKey = Environment.apiKey
}
