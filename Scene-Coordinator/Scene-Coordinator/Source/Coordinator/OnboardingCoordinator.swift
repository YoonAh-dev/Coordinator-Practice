//
//  OnboardingCoordinator.swift
//  Scene-Coordinator
//
//  Created by SHIN YOON AH on 2022/01/30.
//

import UIKit

final class OnboardingCoordinator: Coordinator {
    
    var presenter: UINavigationController
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    
    init(window: UIWindow) {
        presenter = UINavigationController()
        window.backgroundColor = .white
        window.makeKeyAndVisible()
    }

    func start() {
        let onboardingViewController = OnboardingViewController(coordinator: self)
        transition(to: self, with: onboardingViewController, using: .root)
    }
    
    func transitionToLogin(with inputText: String) {
        let childCoordinator = LoginCoordinator(presenter: presenter)
        childCoordinator.parentCoordinator = self
        addChildCoordinator(childCoordinator)
        childCoordinator.start()
    }
    
    func transitionToMain() {
        let childCoordinator = MainCoordinator(presenter: presenter)
        childCoordinator.parentCoordinator = self
        addChildCoordinator(childCoordinator)
        childCoordinator.start()
    }
}
