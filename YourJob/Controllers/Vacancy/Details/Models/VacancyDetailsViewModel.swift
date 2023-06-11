//
//  VacancyDetailsViewModel.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 06.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import Foundation

class VacancyDetailsViewModel {
    let components: [VacancyDetailComponentViewModel]
    let employer: VacancyEmployerViewModel
    
    convenience init(with vacancy: YourJobVacancy) {
        let employer = VacancyEmployerViewModel(with: vacancy.employer!)
        var components: [VacancyDetailComponentViewModel] = []
        
        let title = vacancy.title.trimmingCharacters(in: .whitespacesAndNewlines)
        if !title.isEmpty {
            components.append(VacancyDetailComponentViewModel(with: AppString.View.VacancyDetails.jobTitle.localized(), text: title, isHighlight: true))
        }
        
        let description = (vacancy.description ?? String()).trimmingCharacters(in: .whitespacesAndNewlines)
        if !description.isEmpty {
            components.append(VacancyDetailComponentViewModel(with: AppString.View.VacancyDetails.jobDescription.localized(), text: description, isHighlight: false))
        }
        
        let location = (vacancy.location ?? String()).trimmingCharacters(in: .whitespacesAndNewlines)
        if !location.isEmpty {
            components.append(VacancyDetailComponentViewModel(with: AppString.View.VacancyDetails.location.localized(), text: location, isHighlight: false))
        }
        
        let isRemote = (vacancy.isRemote ? AppString.State.yes : AppString.State.no).localized()
        components.append(VacancyDetailComponentViewModel(with: AppString.View.VacancyDetails.isRemote.localized(), text: isRemote, isHighlight: false))
        
        let salary = max(0, vacancy.salary)
        if salary > 0 {
            components.append(VacancyDetailComponentViewModel(with: AppString.View.VacancyDetails.salary.localized(), text: "\(salary) грн.", isHighlight: true))
        }
        
        let date = Date.fromISO8601String(date: vacancy.updatedAt).toString(format: "d MMMM, yyyy, HH:mm")
        components.append(VacancyDetailComponentViewModel(with: AppString.View.VacancyDetails.published.localized(), text: date, isHighlight: false))
        
        self.init(with: employer, components: components)
    }
    
    init(with employer: VacancyEmployerViewModel, components: [VacancyDetailComponentViewModel]) {
        self.components = components
        self.employer = employer
    }
    
    static func mock() -> VacancyDetailsViewModel {
        let components = [
            VacancyDetailComponentViewModel(with: "Dolorem ipsum", text: "Nemo enim ipsam voluptatem,", isHighlight: true),
            VacancyDetailComponentViewModel(with: "Beatae vitae", text: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo.", isHighlight: false),
            VacancyDetailComponentViewModel(with: "Enim ipsam", text: "Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit, amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt, ut labore et dolore magnam aliquam quaerat voluptatem.", isHighlight: false),
            VacancyDetailComponentViewModel(with: "Dolor sit", text: "200$", isHighlight: true),
            VacancyDetailComponentViewModel(with: "Dolor aft", text: "05.06.23 17:24", isHighlight: true),
        ]
        
        let employer = VacancyEmployerViewModel.mock()
        
        let model = VacancyDetailsViewModel(with: employer, components: components)
        return model
    }
}
