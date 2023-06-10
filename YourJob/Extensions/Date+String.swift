//
//  Date+String.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 10.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import Foundation


extension Date {
    static func fromString(_ value: String, format: String = "yyyy-MM-dd") -> Date? {
        let formater = DateFormatter()
        formater.dateStyle = .short
        formater.dateFormat = format
        return formater.date(from: value)
    }
    
    func toString(format: String = "yyyy-MM-dd") -> String {
        let formater = DateFormatter()
        formater.dateStyle = .short
        formater.dateFormat = format
        return formater.string(from: self)
    }
}
