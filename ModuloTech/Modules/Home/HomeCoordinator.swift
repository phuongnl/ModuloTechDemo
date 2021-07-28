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
    private let lightViewModel: LightViewModel
    private let rollerShutterViewModel: RollerShutterViewModel
    private let heaterViewModel: HeaterViewModel
    
    init(homeViewModel: HomeViewModel, lightViewModel: LightViewModel, rollerShutterViewModel: RollerShutterViewModel, heaterViewModel: HeaterViewModel) {
        self.homeViewModel = homeViewModel
        self.lightViewModel = lightViewModel
        self.rollerShutterViewModel = rollerShutterViewModel
        self.heaterViewModel = heaterViewModel
    }
    
    override func start() {
        setUpBindings()
        let homeViewController = HomeViewController.loadFromNib()
        homeViewController.viewModel = self.homeViewModel
        navigationController.viewControllers = [homeViewController]
    }
    
    private func setUpBindings() {
        self.homeViewModel.didTapLight
            .subscribe(onNext: { [weak self] in self?.didTapLight() })
            .disposed(by: disposeBag)
        
        self.homeViewModel.didTapRollerShutter
            .subscribe(onNext: { [weak self] in self?.didTapRollerShutter() })
            .disposed(by: disposeBag)
        
        self.homeViewModel.didTapHeater
            .subscribe(onNext: { [weak self] in self?.didTapHeater() })
            .disposed(by: disposeBag)
    }
    
    private func didTapLight() {
        let lightViewController = LightViewController.loadFromNib()
        lightViewController.viewModel = self.lightViewModel
        navigationController.pushViewController(lightViewController, animated: true)
    }
    
    private func didTapRollerShutter() {
        let rollerShutterViewController = RollerShutterViewController.loadFromNib()
        rollerShutterViewController.viewModel = self.rollerShutterViewModel
        navigationController.pushViewController(rollerShutterViewController, animated: true)
    }
    
    private func didTapHeater() {
        let heaterViewController = HeaterViewController.loadFromNib()
        heaterViewController.viewModel = self.heaterViewModel
        navigationController.pushViewController(heaterViewController, animated: true)
    }
    
}
