//
//  Container+ViewModels.swift
//  ModuloTech
//
//  Created by Lucas Lee on 28/07/2021.
//  Copyright © 2021 Lucas Lee. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration

extension Container {
    func registerViewModels() {
        autoregister(HomeViewModel.self, initializer: HomeViewModel.init)
        autoregister(LightViewModel.self, initializer: LightViewModel.init)
        autoregister(RollerShutterViewModel.self, initializer: RollerShutterViewModel.init)
        autoregister(HeaterViewModel.self, initializer: HeaterViewModel.init)
        autoregister(ProfileViewModel.self, initializer: ProfileViewModel.init)
    }
}

