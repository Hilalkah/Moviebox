//
//  AppContainer.swift
//  Moviebox
//
//  Created by Hilal Kahraman on 4.02.2026.
//

import UIKit

let app = AppContainer()

final class AppContainer {
    
    let service = TopMoviesService()
    
    lazy var router: AppRouter = {
       fatalError("Router must be initialized with a scene using createRouter(scene:)")
    }()
    
    func createRouter(scene: UIWindowScene) -> AppRouter {
        let router = AppRouter(scene: scene)
        self.router = router
        return router
    }
}
