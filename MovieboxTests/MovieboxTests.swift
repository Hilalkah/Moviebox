//
//  MovieboxTests.swift
//  MovieboxTests
//
//  Created by Hilal Kahraman on 4.02.2026.
//

import XCTest
@testable import Moviebox

@MainActor
final class MovieboxTests: XCTestCase {
    
    private var view: MockView!
    private var viewModel: MovieListViewModel!
    private var service: MockTopMoviesService!

    override func setUp() {
        service = MockTopMoviesService()
        viewModel = MovieListViewModel(service: service)
        view = MockView()
        viewModel.delegate = view
    }

    func testExample() throws {
        // Given:
        let movie1 = try ResourceLoader.loadMovie(resource: .movie1)
        let movie2 = try ResourceLoader.loadMovie(resource: .movie2)
        service.movies = [movie1, movie2]
        
        // When:
        viewModel.load()
                
        // Then:
        XCTAssertEqual(view.outputs.count, 4)
        
        switch try view.outputs.element(at: 0) {
        case .updateTitle(_):
            break // Success
        default:
            XCTFail("Fist output should be updateTitle")
        }
        
        XCTAssertEqual(try view.outputs.element(at: 1), .setLoading(true))
        XCTAssertEqual(try view.outputs.element(at: 2), .setLoading(false))
        
        let expectedMovies = [movie1, movie2].map({ MoviePresentation(movie: $0)})
        XCTAssertEqual(try view.outputs.element(at: 3), .showMovieList(expectedMovies))
    }
}

private class MockView: MovieListViewModelDelegate {
    
    var outputs: [MovieListViewModelOutput] = []
    
    func handleViewModelOutput(_ output: MovieListViewModelOutput) {
        outputs.append(output)
    }
}
