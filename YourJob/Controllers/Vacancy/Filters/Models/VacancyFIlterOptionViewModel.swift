//
//  VacancyFIlterEnumItemViewModel.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 07.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import Foundation
import UIKit

class VacancyFIlterOptionViewModel {
    let title: String
    var value: YourJobCategory
    var isSelected: Bool
    
    init(with value: YourJobCategory, isSelected: Bool) {
        self.value = value
        self.title = value.description.localized()
        self.isSelected = isSelected
    }
}
