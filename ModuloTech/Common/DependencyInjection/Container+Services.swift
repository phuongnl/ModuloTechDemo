//
//  Container+Services.swift
//  ModuloTech
//
//  Created by Lucas Lee on 28/07/2021.
//  Copyright © 2021 Lucas Lee. All rights reserved.
//

import Swinject
import SwinjectAutoregistration

extension Container {
    func registerServices() {
        autoregister(ModuloRemoteDataSource.self, initializer: ModuloRemoteDataSource.init).inObjectScope(.container)
    }
}

