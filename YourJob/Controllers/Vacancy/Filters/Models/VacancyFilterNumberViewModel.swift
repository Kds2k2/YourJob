//
//  VacancyFilterNumberViewModel.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 07.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import Foundation
import UIKit

class VacancyFilterNumberViewModel {
    var value: Int?
    var format: String
    
    init(with value: Int?, format: String = "%d") {
        self.value = value
        self.format = format
    }
}
