//
//  LoginCoordinator.swift
//  Scene-Coordinator
//
//  Created by SHIN YOON AH on 2022/02/02.
//

import UIKit

final class LoginCoordinator: Coordinator {
    
    enum LoginTransition {
        case main
    }
    
    var presenter: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let loginViewController = LoginViewController(coordinator: self)
        transition(to: self, with: loginViewController, using: .modal, animated: true)
    }
    
    func performTransition(to transition: LoginTransition) {
        switch transition {
        case .main:
            let coordinator = MainCoordinator(presenter: presenter)
            addChildCoordinator(coordinator)
            coordinator.start()
        }
    }
}
