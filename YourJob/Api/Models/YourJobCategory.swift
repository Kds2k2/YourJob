//
//  YourJobCategory.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 11.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import Foundation

extension YourJobCategory: CaseIterable {
    public static var allCases: [YourJobCategory] {
        return [
            .delivery,
            .design,
            .construction,
            .engineering,
            .entertainment,
            .informationTechnology,
            .salesAndPurchase,
            .serviceIndustries
        ]
    }
}

extension YourJobCategory: CustomStringConvertible {
    public var description: String {
        switch self {
        case .delivery: return AppString.VacancyCategory.delivery
        case .serviceIndustries: return AppString.VacancyCategory.serviceIndustries
        case .salesAndPurchase: return AppString.VacancyCategory.salesAndPurchase
        case .design: return AppString.VacancyCategory.design
        case .entertainment: return AppString.VacancyCategory.entertainment
        case .engineering: return AppString.VacancyCategory.engineering
        case .informationTechnology: return AppString.VacancyCategory.informationTechnology
        case .construction: return AppString.VacancyCategory.construction
        case .unknown(let value): return value
        }
    }
}
