//
//  ViewController.swift
//  Scene-Coordinator
//
//  Created by SHIN YOON AH on 2022/01/30.
//

import UIKit

final class ViewController: UIViewController {
    
    private var coordinator: AppCoordinator
    
    private let button: UIButton = {
        let button = UIButton(frame: CGRect(origin: CGPoint(x: 100, y: 100), size: CGSize(width: 100, height: 100)))
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        return button
    }()
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(button)
    }
    
    @objc
    private func didTapLoginButton() {
        coordinator.performTransition(to: .login)
    }
}
