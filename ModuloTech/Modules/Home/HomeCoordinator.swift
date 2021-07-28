//
//  HomeCoordinator.swift
//  ModuloTech
//
//  Created by Lucas Lee on 27/07/2021.
//  Copyright © 2021 Lucas Lee. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeCoordinator: BaseCoordinator {
    
    private let disposeBag = DisposeBag()
    private let homeViewModel: HomeViewModel
    
    init(homeViewModel: HomeViewModel) {
        self.homeViewModel = homeViewModel
    }
    
    override func start() {
        let homeViewController = HomeViewController.loadFromNib()
        homeViewController.viewModel = self.homeViewModel
        navigationController.viewControllers = [homeViewController]
    }
    
}
