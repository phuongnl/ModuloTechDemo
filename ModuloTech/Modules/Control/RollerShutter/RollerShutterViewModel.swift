//
//  RollerShutterViewModel.swift
//  ModuloTech
//
//  Created by Lucas Lee on 27/07/2021.
//  Copyright © 2021 Lucas Lee. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RollerShutterViewModel {
    
    private let disposeBag = DisposeBag()
    var rollerShutter = BehaviorRelay<RollerShutter?>(value: nil)
    var position = BehaviorRelay<Float>(value: 0)
    
    init() {
        self.position.subscribe(onNext: { [weak self] value in
            guard let self = self else { return }
            var newRollerShutter = self.rollerShutter.value
            newRollerShutter?.position = Int(value)
            self.rollerShutter.accept(newRollerShutter)
        }).disposed(by: disposeBag)
    }
    
}
