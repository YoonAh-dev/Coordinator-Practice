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
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let mainViewController = MainViewController(coordinator: self)
        transition(to: self, with: mainViewController, using: .push, animated: true)
    }
}

