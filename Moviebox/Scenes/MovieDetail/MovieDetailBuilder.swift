//
//  MovieDetailBuilder.swift
//  Moviebox
//
//  Created by Hilal Kahraman on 4.02.2026.
//

import UIKit

final class MovieDetailBuilder {
    
    static func make(with viewModel: MovieDetailViewModelProtocol) -> MovieDetailViewController {
        let storyboard = UIStoryboard(name: "MovieDetail", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MovieDetailViewController") as! MovieDetailViewController
        viewController.viewModel = viewModel
        return viewController
    }
}
