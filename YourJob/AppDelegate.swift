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
        var backgroundView: BackgroundView = {
            let view = BackgroundView()
            view.imageView.image = nil
            view.effectView.effect = UIBlurEffect(style: .systemMaterial)
            view.backgroundColor = .red
            return view
        }()
        
        let controller = UINavigationController(nibName: nil, bundle: nil)
        controller.view.insertSubview(backgroundView, at: 0)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.topAnchor.constraint(equalTo: controller.view.topAnchor, constant: 0).isActive = true
        backgroundView.leftAnchor.constraint(equalTo: controller.view.leftAnchor, constant: 0).isActive = true
        backgroundView.rightAnchor.constraint(equalTo: controller.view.rightAnchor, constant: 0).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: controller.navigationBar.bottomAnchor, constant: 0).isActive = true
        
        let navigationBaAppearance = UINavigationBarAppearance()
        navigationBaAppearance.configureWithTransparentBackground()
        navigationBaAppearance.backgroundEffect = nil
        
        controller.navigationBar.standardAppearance = navigationBaAppearance
        controller.navigationBar.compactAppearance = navigationBaAppearance
        controller.navigationBar.scrollEdgeAppearance = navigationBaAppearance
        controller.navigationBar.backgroundColor = .clear
        controller.navigationBar.isTranslucent = false
        controller.navigationBar.isHidden = false
        return controller
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AppLog.info("Bundle: \(AppInfo.bundleInfo)")
        AppLog.info("Device: \(AppInfo.deviceInfo)")
        AppLog.info("System: \(AppInfo.systemInfo)")
        AppLog.info("Locale: \(AppInfo.localeInfo)")
        
        navigationController.pushViewController(WelcomeViewController(), animated: false)
        //navigationController.pushViewController(SignUpRegisterViewController(), animated: false)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}

//MARK: About
extension AppDelegate {
    @objc static func showAbout() {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let imageAttachment = AppImage.Logo.app?.makeAttachment(maxPixelSize: Int(72 * AppFont.scale))
        delegate.navigationController.presentAlert(imageAttachment: imageAttachment, attrubutedMessage: aboutInfo)
    }
    
    static var aboutInfo: NSAttributedString {
        let attributedInfo = NSMutableAttributedString()
        attributedInfo.append(NSAttributedString(string: AppString.Common.version.localized() + " ",
                                                 attributes: [.font: AppFont.Alert.message, .foregroundColor: UIColor.label]))
        attributedInfo.append(NSAttributedString(string: "\(AppInfo.bundleVersion) (\(AppInfo.bundleBuild))\n",
                                                 attributes: [.font: AppFont.Alert.message, .foregroundColor: UIColor.secondaryLabel]))
        return attributedInfo
    }
}
