//
//  VacancyFilterStringViewModel.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 07.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import Foundation
import UIKit

class VacancyFilterStringViewModel {
    var value: String?
    let placeholder: String?
    let contentType: UITextContentType
    
    init(with value: String?, placeholder: String? = nil, contentType: UITextContentType = .name) {
        self.value = value
        self.placeholder = placeholder
        self.contentType = contentType
    }
}
