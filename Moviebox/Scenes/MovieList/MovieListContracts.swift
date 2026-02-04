//
//  MovieListContracts.swift
//  Moviebox
//
//  Created by Hilal Kahraman on 4.02.2026.
//

import Foundation

protocol MovieListViewModelProtocol {
    var delegate: MovieListViewModelDelegate? { get set }
    func load()
    func selectMovie(at index: Int)
}

enum MovieListViewModelOutput {
    case updateTitle(String)
    case setLoading(Bool)
    case showMovieList([AnyObject]) // TODO: Update array
}

protocol MovieListViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: MovieListViewModelOutput)
}
