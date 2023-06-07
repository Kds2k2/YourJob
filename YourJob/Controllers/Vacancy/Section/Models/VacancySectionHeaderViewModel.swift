//
//  VacancySectionHeaderViewModel.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 06.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import Foundation

class VacancySectionHeaderViewModel {
    let attributedTitle: NSAttributedString
    
    init(with title: String) {
        self.attributedTitle = NSAttributedString(string: title.localized().uppercased(), attributes:[
            .font: AppFont.Cell.header,
            .foregroundColor: AppColor.Cell.header
        ])
    }
}
