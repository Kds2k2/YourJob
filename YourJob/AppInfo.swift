//
//  AppInfo.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 04.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import Foundation
import UIKit

struct AppInfo {
    static var bundleName: String {
        return Bundle.main.infoDictionary!["CFBundleName"] as! String
    }
    
    static var bundleVersion: String {
        return Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    }
    
    static var bundleBuild: String {
        return Bundle.main.infoDictionary!["CFBundleVersion"] as! String
    }
    
    static var bundleInfo: String {
        return "\(bundleName) \(bundleVersion) (\(bundleBuild))"
    }
    
    static var deviceName: String {
        return UIDevice.current.name
    }
    
    static var deviceType: String {
        return UIDevice.current.model
    }
    
    static var deviceModel: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let model = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return model
    }
    
    static var deviceInfo: String {
        return "\(deviceName), \(deviceType), \(deviceModel)"
    }
    
    static var systemName: String {
        return UIDevice.current.systemName
    }
    
    static var systemVersion: String {
        return UIDevice.current.systemVersion
    }
    
    static var systemInfo: String {
        return "\(systemName) \(systemVersion)"
    }
    
    static var localeInfo: String {
        return Locale.current.identifier
    }
    
    static var isIpad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
}
