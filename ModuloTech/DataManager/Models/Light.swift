//
//  Light.swift
//  ModuloTech
//
//  Created by Lucas Lee on 27/07/2021.
//  Copyright © 2021 Lucas Lee. All rights reserved.
//

import Foundation

struct Light: Device {
    var id: Int
    var deviceName: String
    var intensity: Int
    var mode: String
    var productType: String
}

extension Light: Codable {}
