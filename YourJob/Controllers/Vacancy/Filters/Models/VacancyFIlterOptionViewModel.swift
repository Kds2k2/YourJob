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
    var isSelected: Bool
    
    init(with title: String, isSelected: Bool) {
        self.title = title
        self.isSelected = isSelected
    }
}
