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
            let menuNavigation = UINavigationController()
            let menuAssembly = AssemblyHomeModules()
            let menuRouter = RouterHomeModules(assembly: menuAssembly, navigation: menuNavigation)
            if let testDataImg = UIImage(named: "menu")?.pngData() {
                let testImg =  UIImage(data: testDataImg, scale: 14.75)
                let testBarItem = UITabBarItem(title: "Меню", image: testImg, selectedImage: nil)
                menuNavigation.tabBarItem = testBarItem
            }
            menuRouter.initHomeModule()
            menuRouter.detailModule()
            
            // MARK:- Order Module
            let orderNavigation = UINavigationController()
            let orderAssembly = AssemblyOrderModules()
            let orderRouter = RouterOrderModules(assembly: orderAssembly, navigation: orderNavigation)
            if let testDataImg = UIImage(named: "busket")?.pngData() {
                let testImg =  UIImage(data: testDataImg, scale: 14.25)
                let testBarItem = UITabBarItem(title: "Корзина", image: testImg, selectedImage: nil)
                orderNavigation.tabBarItem = testBarItem
            }
            orderRouter.initOrderModule()
            
            // MARK:- Profile Module
            let profile = ProfileScreenViewController()
//            profile.view.backgroundColor = .green
            if let testDataImg = UIImage(named: "profile")?.pngData() {
                let testImg =  UIImage(data: testDataImg, scale: 15.25)
                let testBarItem = UITabBarItem(title: "Профиль", image: testImg, selectedImage: nil)
                profile.tabBarItem = testBarItem
            }
            
            window = UIWindow(frame: UIScreen.main.bounds)
            
            let tabBar = UITabBarController()
            tabBar.setViewControllers([menuNavigation, orderNavigation, profile], animated: true)
            tabBar.selectedViewController = profile
            window?.rootViewController = tabBar
            window?.makeKeyAndVisible()

            return true
        }
}
