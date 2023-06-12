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
    
    var filter: ListYourJobVacancyFilterInput? {
        var filter: ListYourJobVacancyFilterInput? = nil
        let selectedCategories = categories.filter({ $0.isSelected }).map({ $0.value })
        if !selectedCategories.isEmpty {
            filter = filter ?? ListYourJobVacancyFilterInput()
            filter!.or = selectedCategories.map({ ListYourJobCategoryInput(category: TableStringFilterInput(eq: $0.rawValue))})
        }
        
        let jobTitleValue = jobTitle.value?.trimmingCharacters(in: .whitespacesAndNewlines) ?? String()
        if !jobTitleValue.isEmpty {
            filter = filter ?? ListYourJobVacancyFilterInput()
            filter!.title = TableStringFilterInput(contains: jobTitleValue.lowercased())
        }
        
        let locationValue = location.value?.trimmingCharacters(in: .whitespacesAndNewlines) ?? String()
        if !locationValue.isEmpty {
            filter = filter ?? ListYourJobVacancyFilterInput()
            filter!.location = TableStringFilterInput(contains: locationValue.lowercased())
        }
        
        let isRemoteValue = isRemote.value ?? nil
        if isRemoteValue != nil {
            filter = filter ?? ListYourJobVacancyFilterInput()
            filter!.isRemote = TableBooleanFilterInput(eq: isRemoteValue)
        }
        
        let salaryValue = salary.value ?? 0
        if salaryValue > 0 {
            filter = filter ?? ListYourJobVacancyFilterInput()
            filter!.salary = TableIntFilterInput(gt: salaryValue)
        }
        return filter
    }
    
    convenience init(with filter: ListYourJobVacancyFilterInput) {
        let selectedCategories = filter.or?.compactMap({ $0?.category?.eq }) ?? []
        let avalaibleCategories = YourJobCategory.allCases
            .compactMap({ VacancyFIlterOptionViewModel(with: $0, isSelected: selectedCategories.contains($0.rawValue))})
            .sorted(by: { $0.title < $1.title })
        
        let jobTitle = VacancyFilterStringViewModel(with: filter.title?.contains, placeholder: AppString.Input.Placeholder.common.localized(), contentType: .jobTitle)
        let location = VacancyFilterStringViewModel(with: filter.location?.contains, placeholder: AppString.Input.Placeholder.common.localized(), contentType: .location)
        let isRemote = VacancyFilterBoolViewModel(with: filter.isRemote?.eq, title: AppString.View.VacancyFilter.isRemote.localized())
        let salary = VacancyFilterNumberViewModel(with: filter.salary?.gt, format: "%d грн.")
        
        self.init(with: avalaibleCategories, jobTitle: jobTitle, location: location, isRemote: isRemote, salary: salary)
    }
    
    init(with categories: [VacancyFIlterOptionViewModel], jobTitle: VacancyFilterStringViewModel, location: VacancyFilterStringViewModel, isRemote: VacancyFilterBoolViewModel, salary: VacancyFilterNumberViewModel) {
        self.categories = categories
        self.jobTitle = jobTitle
        self.location = location
        self.isRemote = isRemote
        self.salary = salary
    }
    
    static func mock() -> VacancyFilterViewModel {
        let categories = [
            VacancyFIlterOptionViewModel(with: YourJobCategory.informationTechnology, isSelected: true),
            VacancyFIlterOptionViewModel(with: YourJobCategory.design, isSelected: false),
            VacancyFIlterOptionViewModel(with: YourJobCategory.entertainment, isSelected: true),
            VacancyFIlterOptionViewModel(with: YourJobCategory.salesAndPurchase, isSelected: false)
        ]
        
        return VacancyFilterViewModel(with: categories,
                                      jobTitle: VacancyFilterStringViewModel(with: "Pizza Delivery", contentType: .jobTitle),
                                      location: VacancyFilterStringViewModel(with: "Lviv", contentType: .location),
                                      isRemote: VacancyFilterBoolViewModel(with: nil, title: "Is Remote"),
                                      salary: VacancyFilterNumberViewModel(with: nil, format: "$%d"))
    }
}
