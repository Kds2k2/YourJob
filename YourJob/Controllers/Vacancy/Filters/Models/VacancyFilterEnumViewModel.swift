//
//  VacancyFilterEnumViewModel.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 07.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import Foundation

class VacancyFilterEnumViewModel {
    var items: [VacancyFIlterOptionViewModel]
    
    init(items: [String], selectedItems: [String]) {
        self.items = items.compactMap({VacancyFIlterOptionViewModel(with: $0, isSelected: selectedItems.contains($0))})
    }
}
