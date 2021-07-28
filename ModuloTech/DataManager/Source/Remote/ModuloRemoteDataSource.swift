//
//  ModuloRemoteDataSource.swift
//  ModuloTech
//
//  Created by Lucas Lee on 27/07/2021.
//  Copyright © 2021 Lucas Lee. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import SwiftyJSON

class ModuloRemoteDataSource {
    
    private let apiString = "http://storage42.com/modulotest/data.json"
    
    func requestListDevices() -> Observable<([Any], User)> {
        let url = URL(string: apiString)!
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return URLSession.shared.rx.response(request: urlRequest)
            .filter { response, _ in
                return 200..<300 ~= response.statusCode
        }.map({ response, data -> ([Any], User) in
            let json = try! JSON(data: data)
            let userJson = json["user"]
            
            // User
            let decoder = JSONDecoder()
            let user = try! decoder.decode(User.self, from: userJson.rawData())
            
            // Devices
            var listDevices: [Any] = [Any]()
            let devicesJson = json["devices"].arrayValue
            for item in devicesJson {
                let deviceType = DeviceType(rawValue: item["productType"].stringValue)
                switch deviceType {
                case .light:
                    let light = try! decoder.decode(Light.self, from: item.rawData())
                    listDevices.append(light)
                case .rollerShutter:
                    let rollerShutter = try! decoder.decode(RollerShutter.self, from: item.rawData())
                    listDevices.append(rollerShutter)
                case .heater:
                    let heater = try! decoder.decode(Heater.self, from: item.rawData())
                    listDevices.append(heater)
                case .none:
                    break
                }
            }
            return (listDevices, user)
        })
    }
    
}
