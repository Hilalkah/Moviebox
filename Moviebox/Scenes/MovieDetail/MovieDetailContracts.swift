//
//  MovieDetailContracts.swift
//  Moviebox
//
//  Created by Hilal Kahraman on 4.02.2026.
//

import Foundation

protocol MovieDetailViewModelDelegate: AnyObject {
    func showDetail(_ presentation: MovieDetailPresentation)
}

protocol MovieDetailViewModelProtocol {
    var delegate: MovieDetailViewModelDelegate? { get set }
    func load()
}
