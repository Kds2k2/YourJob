//
//  VacancyFilterViewModel.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 07.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import Foundation

class VacancyFilterViewModel {
    var categories: [VacancyFIlterOptionViewModel]
    var jobTitle: VacancyFilterStringViewModel
    var location: VacancyFilterStringViewModel
    var isRemote: VacancyFilterBoolViewModel
    var salary: VacancyFilterNumberViewModel
    
    init(with categories: [VacancyFIlterOptionViewModel], jobTitle: VacancyFilterStringViewModel, location: VacancyFilterStringViewModel, isRemote: VacancyFilterBoolViewModel, salary: VacancyFilterNumberViewModel) {
        self.categories = categories
        self.jobTitle = jobTitle
        self.location = location
        self.isRemote = isRemote
        self.salary = salary
    }
    
    static func mock() -> VacancyFilterViewModel {
        let categories = [
            VacancyFIlterOptionViewModel(with: "IT", isSelected: true),
            VacancyFIlterOptionViewModel(with: "Business", isSelected: false),
            VacancyFIlterOptionViewModel(with: "Intertaintment", isSelected: true),
            VacancyFIlterOptionViewModel(with: "Hospital", isSelected: false)
        ]
        
        return VacancyFilterViewModel(with: categories,
                                      jobTitle: VacancyFilterStringViewModel(with: "Pizza Delivery", contentType: .jobTitle),
                                      location: VacancyFilterStringViewModel(with: "Lviv", contentType: .location),
                                      isRemote: VacancyFilterBoolViewModel(with: nil, title: "Is Remote"),
                                      salary: VacancyFilterNumberViewModel(with: nil, format: "$%d"))
    }
}
