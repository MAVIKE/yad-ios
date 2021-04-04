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
            
            let navigation = UINavigationController()
            let assembly = AssemblyModules()
            let router = RouterModules(assembly: assembly, navigation: navigation)
            
            router.initHomeModule()
            
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = navigation
            window?.makeKeyAndVisible()

            return true
        }
}
