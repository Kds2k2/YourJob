//
//  ApiError.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 11.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import Foundation
import AWSAppSync

public struct ApiError: Error {
    private let object: JSONObject

    init(_ object: JSONObject) {
        self.object = object
    }

    init(_ message: String) {
        self.init(["message": message])
    }

    init (_ errors: [GraphQLError]) {
        let message = errors.compactMap({$0.errorDescription}).joined(separator: "\n")
        self.init(["message": message])
    }
    
    public subscript(key: String) -> Any? {
        return object[key]
    }

    public var message: String {
        return self["message"] as! String
    }
}

extension ApiError: CustomStringConvertible {
    public var description: String {
        return self.message
    }
}


