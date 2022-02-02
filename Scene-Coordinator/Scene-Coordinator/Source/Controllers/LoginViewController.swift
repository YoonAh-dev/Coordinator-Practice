//
//  LoginViewController.swift
//  Scene-Coordinator
//
//  Created by SHIN YOON AH on 2022/02/02.
//

import UIKit

final class LoginViewController: UIViewController {
    
    private var coordinator: LoginCoordinator
    
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
    }
}
