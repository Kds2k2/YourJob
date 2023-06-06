//
//  AppLayout.swift
//  Your Job
//
//  Created by Dmitro Kryzhanovsky on 05.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import Foundation

struct AppLayout {
    struct View {
        static let inset: CGFloat = AppInfo.isIpad ? 150 : 30
    }
    
    struct Button {
        static let cornerRadius: CGFloat = 5
        static let height: CGFloat = 40
    }
    
    struct Table {
        static let inset: CGFloat = AppInfo.isIpad ? 30 : 15
    }
    
    struct Logo {
        static let height: CGFloat = 100
        static let width: CGFloat = 100
    }
    
    struct Input {
        static let borderWidth: CGFloat = 0.5
        static let cornerRadius: CGFloat = 5
    }
}
