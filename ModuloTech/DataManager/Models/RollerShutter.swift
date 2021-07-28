//
//  RollerShutter.swift
//  ModuloTech
//
//  Created by Lucas Lee on 27/07/2021.
//  Copyright © 2021 Lucas Lee. All rights reserved.
//

import Foundation

struct RollerShutter: Device {
    var id: Int
    var deviceName: String
    var position: Int
    var productType: String
}

extension RollerShutter: Codable {}
