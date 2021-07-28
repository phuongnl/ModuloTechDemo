//
//  AppDelegate.swift
//  ModuloTech
//
//  Created by Lucas Lee on 27/07/2021.
//  Copyright © 2021 Lucas Lee. All rights reserved.
//

import UIKit
import Swinject

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        let homeViewController = HomeViewController.loadFromNib()
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = homeViewController
        self.window?.makeKeyAndVisible()
        return true
    }
    
}

