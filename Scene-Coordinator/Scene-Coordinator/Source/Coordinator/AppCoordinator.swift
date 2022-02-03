//
//  AppCoordinator.swift
//  Scene-Coordinator
//
//  Created by SHIN YOON AH on 2022/01/30.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    enum AppTransition {
        case login
        case main
    }
    
    var presenter: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(window: UIWindow) {
        presenter = UINavigationController()
        window.backgroundColor = .white
        window.makeKeyAndVisible()
    }

    func start() {
        let viewController = ViewController(coordinator: self)
        transition(to: self, with: viewController, using: .root)
    }
    
    func performTransition(to transition: AppTransition) {
        switch transition {
        case .login:
            let childCoordinator = LoginCoordinator(presenter: presenter)
            childCoordinator.parentCoordinator = self
            addChildCoordinator(childCoordinator)
            childCoordinator.start()
        case .main:
            let childCoordinator = MainCoordinator(presenter: presenter)
            childCoordinator.parentCoordinator = self
            addChildCoordinator(childCoordinator)
            childCoordinator.start()
        }
    }
}
