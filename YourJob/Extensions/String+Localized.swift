//
//  String+Localized.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 04.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import Foundation

extension String {
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
