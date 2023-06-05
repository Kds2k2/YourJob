//
//  AppImage.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 04.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import Foundation
import UIKit

struct AppImage {
    struct Logo {
        static let app = UIImage(named: "AppLogo")?.withRenderingMode(.alwaysOriginal)
    }
    
    struct BackGround {
        static let lightBlue = UIImage(named: "LightBlue")
    }
    
    struct Alert {
        private static let configuration = UIImage.SymbolConfiguration(weight: .light)

        struct Info {
            static let normal = UIImage(systemName: "info.circle",
                                        withConfiguration: configuration)?.withTintColor(.systemBlue, renderingMode: .alwaysTemplate)
            static let filled = UIImage(systemName: "info.circle.fill",
                                        withConfiguration: configuration)?.withTintColor(.systemBlue, renderingMode: .alwaysTemplate)
        }
        struct Question {
            static let normal = UIImage(systemName: "questionmark.circle",
                                        withConfiguration: configuration)?.withTintColor(.systemOrange, renderingMode: .alwaysTemplate)
            static let filled = UIImage(systemName: "questionmark.circle.fill",
                                        withConfiguration: configuration)?.withTintColor(.systemOrange, renderingMode: .alwaysTemplate)
        }
        struct Error {
            static let normal = UIImage(systemName: "xmark.circle",
                                        withConfiguration: configuration)?.withTintColor(.systemRed, renderingMode: .alwaysTemplate)
            static let filled = UIImage(systemName: "xmark.circle.fill",
                                        withConfiguration: configuration)?.withTintColor(.systemRed, renderingMode: .alwaysTemplate)
        }
        struct Warning {
            static let normal = UIImage(systemName: "exclamationmark.circle",
                                        withConfiguration: configuration)?.withTintColor(.systemOrange, renderingMode: .alwaysTemplate)
            static let filled = UIImage(systemName: "exclamationmark.circle.fill",
                                        withConfiguration: configuration)?.withTintColor(.systemOrange, renderingMode: .alwaysTemplate)
        }
        struct Success {
            static let normal = UIImage(systemName: "checkmark.circle",
                                        withConfiguration: configuration)?.withTintColor(.systemGreen, renderingMode: .alwaysTemplate)
            static let filled = UIImage(systemName: "checkmark.circle.fill",
                                        withConfiguration: configuration)?.withTintColor(.systemGreen, renderingMode: .alwaysTemplate)
        }
        struct Failure {
            static let normal = UIImage(systemName: "xmark.circle",
                                        withConfiguration: configuration)?.withTintColor(.systemRed, renderingMode: .alwaysTemplate)
            static let filled = UIImage(systemName: "xmark.circle.fill",
                                        withConfiguration: configuration)?.withTintColor(.systemRed, renderingMode: .alwaysTemplate)
        }
    }
    
    struct Chevron {
         private static let configuration = UIImage.SymbolConfiguration(weight: .regular)

         static let up = UIImage(systemName: "chevron.up",
                                   withConfiguration: configuration)?.withRenderingMode(.alwaysTemplate)
         static let down = UIImage(systemName: "chevron.down",
                                    withConfiguration: configuration)?.withRenderingMode(.alwaysTemplate)
         static let left = UIImage(systemName: "chevron.left",
                                   withConfiguration: configuration)?.withRenderingMode(.alwaysTemplate)
         static let right = UIImage(systemName: "chevron.right",
                                    withConfiguration: configuration)?.withRenderingMode(.alwaysTemplate)
     }
}
