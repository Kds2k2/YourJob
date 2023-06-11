//
//  VacancyOfferViewModel.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 10.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import Foundation

class VacancyOfferViewModel {
    var vacancyId: String!
    var timestamp: Date!
    var employerLogoUrl: URL?
    var attributedEmployerTitle: NSAttributedString?
    var attributedVacancyCategory: NSAttributedString?
    var attributedVacancyTitle: NSAttributedString?
    var attributedVacancyDescription: NSAttributedString?
    var attributedVacancySalary: NSAttributedString?
    var attributedPublishedDate: NSAttributedString?
    
    convenience init(with vacancy: YourJobVacancy) {
        self.init(with: vacancy.id, timestamp: vacancy.updatedAt, employerLogoUrl: vacancy.employer?.logoUrl, employerTitle: vacancy.employer?.title, vacancyCategory: vacancy.category.description, vacancyTitle: vacancy.title, vacancyDescription: vacancy.description, vacancySalary: vacancy.salary)
    }
    
    init(with vacancyId: String!, timestamp: String!, employerLogoUrl: String?, employerTitle: String?,
         vacancyCategory: String?, vacancyTitle: String?, vacancyDescription: String?, vacancySalary: Int) {
        
        self.vacancyId = vacancyId
        self.timestamp = Date.fromISO8601String(date: timestamp)
        
        if let employerLogoUrl = employerLogoUrl {
            self.employerLogoUrl = URL(string: employerLogoUrl)
        } else {
            self.employerLogoUrl = nil
        }
        
        if let employerTitle = employerTitle?.trimmingCharacters(in: .whitespacesAndNewlines), !employerTitle.isEmpty {
            self.attributedEmployerTitle = NSAttributedString(string: employerTitle, attributes: [.font: AppFont.Cell.title, .foregroundColor: AppColor.Cell.text])
        } else {
            self.attributedEmployerTitle = nil
        }
        
        if let vacancyCategory = vacancyCategory?.trimmingCharacters(in: .whitespacesAndNewlines), !vacancyCategory.isEmpty {
            self.attributedVacancyCategory = NSAttributedString(string: vacancyCategory, attributes: [.font: AppFont.Cell.header, .foregroundColor: AppColor.Cell.text])
        } else {
            self.attributedVacancyCategory = nil
        }
        
        if let vacancyTitle = vacancyTitle?.trimmingCharacters(in: .whitespacesAndNewlines), !vacancyTitle.isEmpty {
            self.attributedVacancyTitle = NSAttributedString(string: vacancyTitle, attributes: [.font: AppFont.Cell.title, .foregroundColor: AppColor.Cell.text])
        } else {
            self.attributedVacancyTitle = nil
        }
        
        if let vacancyDescription = vacancyDescription?.trimmingCharacters(in: .whitespacesAndNewlines), !vacancyDescription.isEmpty {
            self.attributedVacancyDescription = NSAttributedString(string: vacancyDescription, attributes: [.font: AppFont.Cell.text, .foregroundColor: AppColor.Cell.text])
        } else {
            self.attributedVacancyDescription = nil
        }
        
        let salary = max(0, vacancySalary)
        if salary > 0 {
            self.attributedVacancySalary = NSAttributedString(string: "$\(salary)", attributes: [.font: AppFont.Cell.title, .foregroundColor: AppColor.Cell.text])
        } else {
            self.attributedVacancySalary = nil
        }
    
        let publishedDate = self.timestamp.toString(format: "d MMMM, yyyy, HH:mm")
        self.attributedPublishedDate = NSAttributedString(string: publishedDate, attributes: [.font: AppFont.Cell.header, .foregroundColor: AppColor.Cell.text])
    }
    
    static func mock() -> VacancyOfferViewModel {
        return VacancyOfferViewModel(with: UUID().uuidString, timestamp: Date().toISO8601String(), employerLogoUrl: "https://img.freepik.com/free-photo/road-mountains-with-cloudy-sky_1340-23022.jpg", employerTitle: "Vero Company", vacancyCategory: "IT, Business", vacancyTitle: "iOS Developer", vacancyDescription: "At vero eos et accusamus et iusto odio dignissimos ducimus, qui blanditiis praesentium voluptatum deleniti atque corrupti, quos dolores et quas molestias excepturi sint, obcaecati cupiditate non provident, similique sunt in culpa, qui officia deserunt mollitia animi, id est laborum et dolorum fuga.", vacancySalary: 500)
    }
}
