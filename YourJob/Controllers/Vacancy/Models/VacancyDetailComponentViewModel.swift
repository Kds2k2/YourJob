//
//  VacancyDetailComponentViewModel.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 06.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import Foundation

class VacancyDetailComponentViewModel {
    let header: VacancySectionHeaderViewModel
    let content: VacancyDetailsContentViewModel
    
    init(with title: String, text: String, isHighlight: Bool) {
        self.header = VacancySectionHeaderViewModel(with: title)
        self.content = VacancyDetailsContentViewModel(with: text, isHighlight: isHighlight)
    }
}
