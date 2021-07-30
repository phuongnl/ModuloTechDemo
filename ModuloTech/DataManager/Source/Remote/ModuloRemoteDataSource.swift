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
    
    init() {
        URLSession.rx.shouldLogRequest = { _ in
            return true
        }
    }
    
    func requestListDevices() -> Observable<([Any], User)> {
        let url = URL(string: apiString)!
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return URLSession.shared.rx.response(request: urlRequest)
            .filter { response, _ in
                return 200..<300 ~= response.statusCode
        }.map({ _, data -> ([Any], User) in
            var listDevices: [Any] = [Any]()
            var user: User!
            do {
                let json = try JSON(data: data)
                let userJson = json["user"]
                
                // User
                let decoder = JSONDecoder()
                user = try decoder.decode(User.self, from: userJson.rawData())
                
                // Devices
                let devicesJson = json["devices"].arrayValue
                for item in devicesJson {
                    let deviceType = DeviceType(rawValue: item["productType"].stringValue)
                    switch deviceType {
                    case .light:
                        let light = try decoder.decode(Light.self, from: item.rawData())
                        listDevices.append(light)
                    case .rollerShutter:
                        let rollerShutter = try decoder.decode(RollerShutter.self, from: item.rawData())
                        listDevices.append(rollerShutter)
                    case .heater:
                        let heater = try decoder.decode(Heater.self, from: item.rawData())
                        listDevices.append(heater)
                    case .none:
                        break
                    }
                }
                return (listDevices, user)
            } catch {
                log.error(error)
            }
            return (listDevices, user)
        })
    }
    
}
