//
//  MainCoordinator.swift
//  Scene-Coordinator
//
//  Created by SHIN YOON AH on 2022/02/03.
//

import UIKit

final class MainCoordinator: Coordinator {
    
    var presenter: UINavigationController
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let mainViewController = MainViewController(coordinator: self)
        mainViewController.tabBarItem = UITabBarItem(title: "메인", image: .checkmark, selectedImage: .strokedCheckmark)
        presenter.setViewControllers([mainViewController], animated: false)
    }
}
