//
//  NSError+Message.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 10.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import Foundation

extension NSError {
    var message: String {
        return userInfo["message"] as? String ?? String()
    }
}
