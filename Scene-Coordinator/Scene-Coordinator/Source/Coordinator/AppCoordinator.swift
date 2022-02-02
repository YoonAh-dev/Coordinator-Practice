//
//  AppCoordinator.swift
//  Scene-Coordinator
//
//  Created by SHIN YOON AH on 2022/01/30.
//

import UIKit

final class AppCoordinator: Coordinator {
    var presenter: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(window: UIWindow) {
        presenter = UINavigationController()
        window.backgroundColor = .white
        window.makeKeyAndVisible()
    }

    func start() {
        transition(to: self, with: ViewController(), using: .root)
    }
}
