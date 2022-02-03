//
//  LoginCoordinator.swift
//  Scene-Coordinator
//
//  Created by SHIN YOON AH on 2022/02/02.
//

import UIKit

final class LoginCoordinator: Coordinator {

    var presenter: UINavigationController
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let loginViewController = LoginViewController(coordinator: self)
        loginViewController.tabBarItem = UITabBarItem(title: "로그인", image: .add, selectedImage: .remove)
        presenter.setViewControllers([loginViewController], animated: false)
    }
    
    func transitionToMain() {
        let childCoordinator = MainCoordinator(presenter: presenter)
        childCoordinator.parentCoordinator = self
        addChildCoordinator(childCoordinator)
        childCoordinator.start()
    }
}
