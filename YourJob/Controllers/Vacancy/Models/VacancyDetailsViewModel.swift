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
    
    init(with components: [VacancyDetailComponentViewModel]) {
        self.components = components
    }
    
    static func mock() -> VacancyDetailsViewModel {
        let components = [
            VacancyDetailComponentViewModel(with: "Dolorem ipsum", text: "Nemo enim ipsam voluptatem,", isHighlight: true),
            VacancyDetailComponentViewModel(with: "Beatae vitae", text: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo.", isHighlight: false),
            VacancyDetailComponentViewModel(with: "Enim ipsam", text: "Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit, amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt, ut labore et dolore magnam aliquam quaerat voluptatem.", isHighlight: false),
            VacancyDetailComponentViewModel(with: "Dolor sit", text: "200$", isHighlight: true),
            VacancyDetailComponentViewModel(with: "Dolor aft", text: "05.06.23 17:24", isHighlight: true),
        ]
        
        let model = VacancyDetailsViewModel(with: components)
        return model
    }
}
