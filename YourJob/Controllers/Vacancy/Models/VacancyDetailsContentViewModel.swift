//
//  VacancyDetailsContentViewModel.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 06.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import Foundation

class VacancyDetailsContentViewModel {
    
    let attributedText: NSAttributedString
    
    init(with text: String, isHighlight: Bool) {
        self.attributedText = NSAttributedString(string: text.localized(), attributes:[
            .font: isHighlight ? AppFont.Cell.title : AppFont.Cell.text,
            .foregroundColor: AppColor.Cell.text
        ])
    }
}
