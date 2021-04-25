//
//  AppDelegate.swift
//  YetAnotherDelivery
//
//  Created by Shamil Imanov on 02.04.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            // Override point for customization after application launch.
            
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = ProfileScreenViewController()
            window?.makeKeyAndVisible()

            return true
        }
}
