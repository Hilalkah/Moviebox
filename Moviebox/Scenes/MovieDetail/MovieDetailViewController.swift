//
//  MovieDetailViewController.swift
//  Moviebox
//
//  Created by Hilal Kahraman on 4.02.2026.
//

import UIKit

final class MovieDetailViewController: UIViewController {
    
    @IBOutlet private weak var movieTitleLabel: UILabel!
    @IBOutlet private weak var overviewLabel: UILabel!
    
    var viewModel: MovieDetailViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.load()
    }
}

extension MovieDetailViewController: MovieDetailViewModelDelegate {
    
    func showDetail(_ presentation: MovieDetailPresentation) {
        movieTitleLabel.text = presentation.title
        overviewLabel.text = presentation.overview
    }
}
