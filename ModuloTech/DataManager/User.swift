//
//  User.swift
//  SmileMirror
//
//  Created by Lucas Lee on 8/6/18.
//  Copyright © 2018 OMM. All rights reserved.
//

import Foundation

struct Address {
    var city: String
    var postalCode: Int
    var street: String
    var streetCode: String
    var country: String
}

extension Address: Codable {
    
}

struct User {
    
    var firstName: String
    var lastName: String
    var address: Address
    var birthDate: TimeInterval
}

extension User: Codable {
    
}
