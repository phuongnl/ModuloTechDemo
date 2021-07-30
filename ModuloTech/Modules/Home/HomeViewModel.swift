//
//  HomeViewModel.swift
//  ModuloTech
//
//  Created by Lucas Lee on 27/07/2021.
//  Copyright © 2021 Lucas Lee. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel {
    
    private let disposeBag = DisposeBag()
    private let remoteDataSource: ModuloRemoteDataSource
    
    let title = L10n.home
    let isLoading = BehaviorSubject(value: true)
    
    let user = BehaviorRelay<User?>(value: nil)
    let devices = BehaviorSubject(value: [Any]())
    
    let didTapLight = PublishSubject<Light>()
    let didTapRollerShutter = PublishSubject<RollerShutter>()
    let didTapHeater = PublishSubject<Heater>()
    let didTapProfile = PublishSubject<Void>()
    
    init(remoteDataSource: ModuloRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
        self.fetchDevices()
    }
    
    private func fetchDevices() {
        isLoading.onNext(true)
        remoteDataSource.requestListDevices()
            .do(onNext: { [weak self] _ in self?.isLoading.onNext(false) })
            .subscribe(onNext: { (devices, user) in
                self.user.accept(user)
                self.devices.onNext(devices)
            }).disposed(by: disposeBag)
    }
    
    @objc func showProfile() {
        self.didTapProfile.onNext(())
    }
    
}
