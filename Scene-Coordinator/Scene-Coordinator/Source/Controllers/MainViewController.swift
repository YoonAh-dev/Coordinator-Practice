//
//  MainViewController.swift
//  Scene-Coordinator
//
//  Created by SHIN YOON AH on 2022/02/03.
//

import UIKit

final class MainViewController: UIViewController {

    private var coordinator: MainCoordinator
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        coordinator.didFinishMain()
    }
}
