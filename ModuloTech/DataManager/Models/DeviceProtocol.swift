//
//  DeviceProtocol.swift
//  ModuloTech
//
//  Created by Lucas Lee on 28/07/2021.
//  Copyright © 2021 Lucas Lee. All rights reserved.
//

import Foundation

protocol Device {
    var id: Int { get set }
    var deviceName: String { get set }
    var productType: String { get set }
}
