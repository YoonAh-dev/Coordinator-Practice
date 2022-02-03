//
//  OnboardingViewController.swift
//  Scene-Coordinator
//
//  Created by SHIN YOON AH on 2022/01/30.
//

import UIKit

final class OnboardingViewController: UIViewController {
    
    private var coordinator: OnboardingCoordinator
    
    private let button: UIButton = {
        let button = UIButton(frame: CGRect(origin: CGPoint(x: 100, y: 100), size: CGSize(width: 100, height: 100)))
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        return button
    }()
    
    private let button2: UIButton = {
        let button = UIButton(frame: CGRect(origin: CGPoint(x: 100, y: 300), size: CGSize(width: 100, height: 100)))
        button.setTitle("main", for: .normal)
        button.addTarget(self, action: #selector(didTapMainButton), for: .touchUpInside)
        return button
    }()
    
    init(coordinator: OnboardingCoordinator) {
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
        view.addSubview(button2)
    }
    
    @objc
    private func didTapLoginButton() {
        coordinator.transitionToLogin(with: "아니 왜이래")
    }
    
    @objc
    private func didTapMainButton() {
        coordinator.transitionToMain()
    }
}
