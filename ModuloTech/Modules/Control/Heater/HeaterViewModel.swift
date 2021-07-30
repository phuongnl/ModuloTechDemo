//
//  HeaterViewModel.swift
//  ModuloTech
//
//  Created by Lucas Lee on 27/07/2021.
//  Copyright © 2021 Lucas Lee. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HeaterViewModel {
    
    private let disposeBag = DisposeBag()
    var heater = BehaviorRelay<Heater?>(value: nil)
    let temperature = BehaviorRelay<Int>(value: 0)
    let heaterMode = BehaviorRelay<Bool>(value: false)
    
    init() {
        self.temperature.subscribe(onNext: { [weak self] value in
            guard let self = self else { return }
            var newHeater = self.heater.value
            newHeater?.temperature = Int(value)
            self.heater.accept(newHeater)
        }).disposed(by: disposeBag)
        
        self.heaterMode.subscribe(onNext: { [weak self] value in
            guard let self = self else { return }
            var newHeater = self.heater.value
            newHeater?.mode = value == true ? DeviceMode.onn.rawValue : DeviceMode.off.rawValue
            self.heater.accept(newHeater)
        }).disposed(by: disposeBag)
    }
}
