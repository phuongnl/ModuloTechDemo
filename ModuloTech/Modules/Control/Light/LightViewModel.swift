//
//  LightViewModel.swift
//  ModuloTech
//
//  Created by Lucas Lee on 27/07/2021.
//  Copyright © 2021 Lucas Lee. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LightViewModel {
    
    private let disposeBag = DisposeBag()
    var light = BehaviorRelay<Light?>(value: nil)
    let intensity = BehaviorRelay<Float>(value: 0)
    let lightMode = BehaviorRelay<Bool>(value: false)
    
    init() {
        self.intensity.subscribe(onNext: { [weak self] value in
            guard let self = self else { return }
            var newLight = self.light.value
            newLight?.intensity = Int(value)
            self.light.accept(newLight)
        }).disposed(by: disposeBag)
        
        self.lightMode.subscribe(onNext: { [weak self] value in
            guard let self = self else { return }
            var newLight = self.light.value
            newLight?.mode = value == true ? DeviceMode.onn.rawValue : DeviceMode.off.rawValue
            self.light.accept(newLight)
        }).disposed(by: disposeBag)
    }
    
}
