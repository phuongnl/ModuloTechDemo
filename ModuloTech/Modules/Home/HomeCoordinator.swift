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
            .subscribe(onNext: { [weak self] light in self?.didTapLight(light) })
            .disposed(by: disposeBag)
        
        self.homeViewModel.didTapRollerShutter
            .subscribe(onNext: { [weak self] rollerShutter in self?.didTapRollerShutter(rollerShutter) })
            .disposed(by: disposeBag)
        
        self.homeViewModel.didTapHeater
            .subscribe(onNext: { [weak self] heater in self?.didTapHeater(heater) })
            .disposed(by: disposeBag)
    }
    
    private func didTapLight(_ light: Light) {
        let lightViewController = LightViewController.loadFromNib()
        lightViewController.viewModel = self.lightViewModel
        lightViewController.viewModel.light
            .subscribe(onNext: { light in
//                self.homeViewModel.devices
//                    .subscribe(onNext: { [weak self] devices in
//                        var newDevices = devices
//                        for (index, item) in newDevices.enumerated() {
//                            if let item = item as? Device, item.id == light?.id {
//                                newDevices[index] = light
//                            }
//                        }
//                        self?.homeViewModel.devices.onNext(newDevices)
//                        log.verbose(newDevices)
//                    }).disposed(by: self.disposeBag)
                log.verbose("leu leu: \(String(describing: light))")

            }).disposed(by: disposeBag)
        lightViewController.viewModel.light.accept(light)
        navigationController.pushViewController(lightViewController, animated: true)
    }
    
    private func didTapRollerShutter(_ rollerShutter: RollerShutter) {
        let rollerShutterViewController = RollerShutterViewController.loadFromNib()
        rollerShutterViewController.viewModel = self.rollerShutterViewModel
        rollerShutterViewController.viewModel.rollerShutter.accept(rollerShutter)
        navigationController.pushViewController(rollerShutterViewController, animated: true)
    }
    
    private func didTapHeater(_ heater: Heater) {
        let heaterViewController = HeaterViewController.loadFromNib()
        heaterViewController.viewModel = self.heaterViewModel
        heaterViewController.viewModel.heater.accept(heater)
        heaterViewController.viewModel.heater
            .subscribe(onNext: { heater in
                log.verbose("leu leu: \(String(describing: heater))")
            }).disposed(by: disposeBag)
        navigationController.pushViewController(heaterViewController, animated: true)
    }
    
}
