//
//  VacancyFilterBoolViewModel.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 07.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import Foundation
import UIKit

class VacancyFilterBoolViewModel {
    var value: Bool?
    let title: String
    
    init(with value: Bool?, title: String) {
        self.value = value
        self.title = title
    }
}
