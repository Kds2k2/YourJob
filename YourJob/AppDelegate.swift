//
//  AppDelegate.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 04.06.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var window: UIWindow? = {
        let window = UIWindow()
        window.backgroundColor = .systemBackground
        return window
    }()
    
    lazy var navigationController: UINavigationController = {
        let controller = UINavigationController(nibName: nil, bundle: nil)
        return controller
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AppLog.info("Bundle: \(AppInfo.bundleInfo)")
        AppLog.info("Device: \(AppInfo.deviceInfo)")
        AppLog.info("System: \(AppInfo.systemInfo)")
        AppLog.info("Locale: \(AppInfo.localeInfo)")
        
        navigationController.pushViewController(WelcomeViewController(), animated: false)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}
