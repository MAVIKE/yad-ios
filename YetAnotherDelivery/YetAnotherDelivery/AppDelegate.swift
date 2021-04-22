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
            if let testDataImg = UIImage(named: "menu")?.pngData() {
                let testImg =  UIImage(data: testDataImg, scale: 6.7)
                let testBarItem = UITabBarItem(title: "", image: testImg, selectedImage: nil)
                navigation.tabBarItem = testBarItem
            }
            router.initHomeModule()
            router.detailModule()
            
            window = UIWindow(frame: UIScreen.main.bounds)
            
            let tabBar = UITabBarController()
            tabBar.setViewControllers([navigation], animated: true)
            tabBar.selectedViewController = navigation
            window?.rootViewController = tabBar
            window?.makeKeyAndVisible()

            return true
        }
}
