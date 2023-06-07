//
//  VacancyEmployerViewModel.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 07.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import Foundation

class VacancyEmployerViewModel {
    var logoUrl: URL?
    var attributedTitle: NSAttributedString?
    var attributedDescription: NSAttributedString?
    var attributedEmail: NSAttributedString?
    var attributedPhone: NSAttributedString?
    
    init(with logoUrl: String?, title: String?, description: String?, email: String?, phone: String?) {
        if let logoUrl = logoUrl, !logoUrl.isEmpty {
            self.logoUrl = URL(string: logoUrl)
        } else {
            self.logoUrl = nil
            
        }
        
        if let title = title?.trimmingCharacters(in: .whitespacesAndNewlines), !title.isEmpty {
            self.attributedTitle = NSAttributedString(string: title, attributes: [.font: AppFont.Cell.title, .foregroundColor: AppColor.Cell.text])
        } else {
            self.attributedTitle = nil
        }
        
        if let description = description?.trimmingCharacters(in: .whitespacesAndNewlines), !description.isEmpty {
            self.attributedDescription = NSAttributedString(string: description, attributes: [.font: AppFont.Cell.text, .foregroundColor: AppColor.Cell.text])
        } else {
            self.attributedDescription = nil
        }
        
        if let email = email?.trimmingCharacters(in: .whitespacesAndNewlines), !email.isEmpty {
            self.attributedEmail = NSAttributedString(string: AppString.View.VacancyDetails.email.localized().uppercased() + " " + email, attributes: [.font: AppFont.Cell.subTitle, .foregroundColor: AppColor.Cell.text])
        } else {
            self.attributedEmail = nil
        }
        
        if let phone = phone?.trimmingCharacters(in: .whitespacesAndNewlines), !phone.isEmpty {
            self.attributedPhone = NSAttributedString(string: AppString.View.VacancyDetails.phone.localized().uppercased() + " " + phone, attributes: [.font: AppFont.Cell.subTitle, .foregroundColor: AppColor.Cell.text])
        } else {
            self.attributedPhone = nil
        }
    }
    
    public static func mock() -> VacancyEmployerViewModel{
        let model = VacancyEmployerViewModel(with: "https://img.freepik.com/free-photo/road-mountains-with-cloudy-sky_1340-23022.jpg", title: "At vero eos", description: "At vero eos et accusamus et iusto odio dignissimos ducimus, qui blanditiis praesentium voluptatum deleniti atque corrupti, quos dolores et quas molestias excepturi sint, obcaecati cupiditate non provident, similique sunt in culpa, qui officia deserunt mollitia animi, id est laborum et dolorum fuga.", email: "test@gmail.com", phone: "0983538752")
        return model
    }
}
