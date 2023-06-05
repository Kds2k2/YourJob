//
//  AppFont.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 04.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import Foundation
import UIKit

struct AppFont {
    static let scale: CGFloat = AppInfo.isIpad ? 1.25 : 1
    
    struct View {
        static let title = UIFont.montserratFont(ofSize: 24 * scale, weight: .light)
        static let description = UIFont.montserratFont(ofSize: 14 * scale, weight: .light)
        static let resendCode = UIFont.montserratFont(ofSize: 14 * scale, weight: .light)
    }
    
    struct Alert {
        static let title = UIFont.systemFont(ofSize: 18 * scale, weight: .bold)
        static let message = UIFont.systemFont(ofSize: 14 * scale, weight: .regular)
    }
    
    struct Button {
        static let title = UIFont.montserratFont(ofSize: 14 * scale, weight: .regular)
    }
}
