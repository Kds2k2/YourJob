//
//  AppColor.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 04.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import Foundation
import UIKit

struct AppColor {
    struct View {
        static let title = UIColor.label
        static let description = UIColor.label
        static let resendCode = UIColor.systemBlue
        static let background = UIColor.systemBackground
    }
    
    struct Button {
        struct Filled {
            static let background = UIColor.systemBlue
            static let foreground = UIColor.systemBackground
        }
        struct Plaine {
            static let background = UIColor.clear
            static let foreground = UIColor.systemBlue
        }
    }
}
