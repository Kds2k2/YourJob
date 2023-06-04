//
//  Date+ISO8601.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 04.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import Foundation

extension Date {
    static func fromISO8601String(date: String) -> Date {
        let iso8601DateFormatter = ISO8601DateFormatter()
        iso8601DateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return iso8601DateFormatter.date(from: date)!
    }

    func toISO8601String() -> String {
        let iso8601DateFormatter = ISO8601DateFormatter()
        iso8601DateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return iso8601DateFormatter.string(from: self)
    }
}
