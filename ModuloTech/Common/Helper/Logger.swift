//
//  Logger.swift
//  ModuloTech
//
//  Created by Lucas Lee on 28/07/2021.
//  Copyright © 2021 Lucas Lee. All rights reserved.
//

import Foundation
import SwiftyBeaver

let log = SwiftyBeaver.self

class Logger {

    class func setUpLog() {
        let console = ConsoleDestination()  // log to Xcode Console
        let file = FileDestination()  // log to default swiftybeaver.log file
        console.format = "$DHH:mm:ss$d $L $M"
        log.addDestination(console)
        log.addDestination(file)
    }
    
}
