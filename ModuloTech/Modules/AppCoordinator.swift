//
//  AppCoordinator.swift
//  ModuloTech
//
//  Created by Lucas Lee on 28/07/2021.
//  Copyright © 2021 Lucas Lee. All rights reserved.
//

import UIKit
import RxSwift

class AppCoordinator: BaseCoordinator {
    
    private let disposeBag = DisposeBag()
    private var window = UIWindow(frame: UIScreen.main.bounds)

    override func start() {
        showDashboard()
     }
    
    private func showDashboard() {
        removeChildCoordinators()
        let coordinator = AppDelegate.container.resolve(HomeCoordinator.self)!
        start(coordinator: coordinator)
        self.window.rootViewController = coordinator.navigationController
        self.window.makeKeyAndVisible()
    }
    
}
