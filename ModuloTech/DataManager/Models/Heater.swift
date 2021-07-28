//
//  Radiateur.swift
//  ModuloTech
//
//  Created by Lucas Lee on 27/07/2021.
//  Copyright © 2021 Lucas Lee. All rights reserved.
//

import Foundation

struct Heater {
    var id: Int
    var deviceName: String
    var mode: String
    var temperature: Int
    var productType: String
}

extension Heater: Codable {}
