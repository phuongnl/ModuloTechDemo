//
//  Container+RegisterDependencies.swift
//  ModuloTech
//
//  Created by Lucas Lee on 28/07/2021.
//  Copyright © 2021 Lucas Lee. All rights reserved.
//

import Swinject

extension Container {
    func registerDependencies() {
        registerServices()
        registerCoordinators()
        registerViewModels()
    }
}
