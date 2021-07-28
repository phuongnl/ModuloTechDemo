//
//  LightViewModel.swift
//  ModuloTech
//
//  Created by Lucas Lee on 27/07/2021.
//  Copyright © 2021 Lucas Lee. All rights reserved.
//

import UIKit
import RxSwift

class LightViewModel {
    
    private let disposeBag = DisposeBag()
    let light: PublishSubject<Light> = PublishSubject()
    
}
