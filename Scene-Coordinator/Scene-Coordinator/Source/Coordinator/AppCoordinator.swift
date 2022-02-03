//
//  AppCoordinator.swift
//  Scene-Coordinator
//
//  Created by SHIN YOON AH on 2022/02/03.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    var presenter: UINavigationController
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
        presenter = UINavigationController()
        window.backgroundColor = .white
        window.makeKeyAndVisible()
    }

    func start() {
        removeChildCoordinators()
        window.rootViewController = trasitionToTabbarController()
        addChildCoordinator(self)
    }

    func trasitionToTabbarController() -> UITabBarController {
        let tabBarController = UITabBarController()

        let loginCoordinator = LoginCoordinator(presenter: UINavigationController())
        loginCoordinator.start()

        let mainCoordinator = MainCoordinator(presenter: UINavigationController())
        mainCoordinator.start()
        
        tabBarController.viewControllers = [
            loginCoordinator.presenter,
            mainCoordinator.presenter
        ]

        return tabBarController
    }
}
