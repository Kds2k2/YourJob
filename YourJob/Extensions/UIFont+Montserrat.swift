//
//  UIFont+Montserrat.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 04.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    static func montserratFont(ofSize fontSize: CGFloat, weight: UIFont.Weight) -> UIFont {
        var fontName: String
        switch weight{
            case .regular: fontName = "Montserrat-Regular"
            case .medium: fontName = "Montserrat-Medium"
            case .semibold: fontName = "Montserrat-SemiBold"
            case .bold: fontName = "Montserrat-Bold"
            case .heavy: fontName = "Montserrat-Heavy"
            case .black: fontName = "Montserrat-Black"
            case .light: fontName = "Montserrat-Light"
            case .ultraLight: fontName = "Montserrat-ExtraLight"
            case .thin: fontName = "Montserrat-Thin"
            default: fontName = "Montserrat-Regular"
        }
        
        guard let font = UIFont(name: fontName, size: fontSize) else {
            fatalError("Font with name \"\(fontName)\" not found!")
        }
        
        return font
    }
}
