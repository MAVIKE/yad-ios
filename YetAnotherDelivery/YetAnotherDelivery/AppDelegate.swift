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
            
            // MARK:- Menu Module
            let navigation = UINavigationController()
            let assembly = AssemblyModules()
            let router = RouterModules(assembly: assembly, navigation: navigation)
            if let testDataImg = UIImage(named: "menu")?.pngData() {
                let testImg =  UIImage(data: testDataImg, scale: 14.75)
                let testBarItem = UITabBarItem(title: "Меню", image: testImg, selectedImage: nil)
                navigation.tabBarItem = testBarItem
            }
            router.initHomeModule()
            router.detailModule()
            
            // MARK:- Busket Module
            let busket = UIViewController()
            busket.view.backgroundColor = .yellow
            if let testDataImg = UIImage(named: "busket")?.pngData() {
                let testImg =  UIImage(data: testDataImg, scale: 14.25)
                let testBarItem = UITabBarItem(title: "Корзина", image: testImg, selectedImage: nil)
                busket.tabBarItem = testBarItem
            }
            
            // MARK:- Profile Module
            let profile = UIViewController()
            profile.view.backgroundColor = .green
            if let testDataImg = UIImage(named: "profile")?.pngData() {
                let testImg =  UIImage(data: testDataImg, scale: 15.25)
                let testBarItem = UITabBarItem(title: "Профиль", image: testImg, selectedImage: nil)
                profile.tabBarItem = testBarItem
            }
            
            window = UIWindow(frame: UIScreen.main.bounds)
            
            let tabBar = UITabBarController()
            tabBar.setViewControllers([navigation, busket, profile], animated: true)
            tabBar.selectedViewController = navigation
            window?.rootViewController = tabBar
            window?.makeKeyAndVisible()

            return true
        }
}
