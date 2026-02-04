//
//  MovieListBuilder.swift
//  Moviebox
//
//  Created by Hilal Kahraman on 4.02.2026.
//

import UIKit

final class MovieListBuilder {
    
    static func make() -> MovieListViewController {
        let storyboard = UIStoryboard(name: "MovieList", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MovieListViewController") as! MovieListViewController
        viewController.viewModel = MovieListViewModel(service: app.service)
        return viewController
    }
}
