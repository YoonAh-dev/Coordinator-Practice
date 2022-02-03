//
//  Coordinator.swift
//  Scene-Coordinator
//
//  Created by SHIN YOON AH on 2022/01/30.
//

import UIKit

protocol Coordinator: AnyObject {
    var presenter: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }
    var parentCoordinator: Coordinator? { get set }
    
    func start()
}

extension Coordinator {
    func transition(to coordinator: Coordinator,
                    with viewController: UIViewController,
                    using style: TransitionStyle,
                    animated: Bool = false,
                    completion: (() -> Void)? = nil) {
        switch style {
        case .root:
            presenter = UINavigationController(rootViewController: viewController)
            let scene = UIApplication.shared.connectedScenes.first
            if let sceneDelegate: SceneDelegate = scene?.delegate as? SceneDelegate {
                sceneDelegate.window?.rootViewController = presenter
            }
            removeChildCoordinators()
            addChildCoordinator(coordinator)
        case .push:
            addChildCoordinator(coordinator)
            presenter.present(viewController, animated: animated, completion: completion)
        case .modal:
            addChildCoordinator(coordinator)
            presenter.pushViewController(viewController, animated: animated)
        }
    }
    
    func didFinishChildCoordinator() {
        parentCoordinator?.removeChildCoordinator(self)
    }
    
    func addChildCoordinator(_ childCoordinator: Coordinator) {
        self.childCoordinators.append(childCoordinator)
    }
    
    func removeChildCoordinator(_ childCoordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { $0 === childCoordinator }) {
            childCoordinators.remove(at: index)
        }
    }
    
    func removeChildCoordinators() {
        childCoordinators.forEach { $0.removeChildCoordinators() }
        childCoordinators.removeAll()
    }
}
