//
//  AppRouter.swift
//  Moviebox
//
//  Created by Hilal Kahraman on 4.02.2026.
//

import UIKit

final class AppRouter {
    
    let window: UIWindow
    
    init(scene: UIWindowScene) {
        window = UIWindow(windowScene: scene)
    }
    
    func start() {
        let viewController = MovieListBuilder.make()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }    
}
