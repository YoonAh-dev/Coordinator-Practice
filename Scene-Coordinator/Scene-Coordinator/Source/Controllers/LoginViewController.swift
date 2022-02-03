//
//  LoginViewController.swift
//  Scene-Coordinator
//
//  Created by SHIN YOON AH on 2022/02/02.
//

import UIKit

final class LoginViewController: UIViewController {
    
    var coordinator: LoginCoordinator
    var inputText = ""
    
    private let button: UIButton = {
        let button = UIButton(frame: CGRect(origin: CGPoint(x: 100, y: 100), size: CGSize(width: 100, height: 100)))
        button.setTitle("Main", for: .normal)
        button.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        return button
    }()
    
    init(coordinator: LoginCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(button)
        
        print(inputText)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        coordinator.didFinishChildCoordinator()
    }
    
    @objc
    private func didTapLoginButton() {
        coordinator.transitionToMain()
    }
}
