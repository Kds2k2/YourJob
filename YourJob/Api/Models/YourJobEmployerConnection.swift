//
//  YourJobEmployerConnection.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 11.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import Foundation
import AWSAppSync

public struct YourJobEmployerConnection: GraphQLSelectionSet {
    public static let possibleTypes = ["YourJobEmployerConnection"]
    
    public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .list(.nonNull(.object(YourJobEmployer.selections)))),
        GraphQLField("nextToken", type: .scalar(String.self)),
    ]
    
    public var snapshot: Snapshot
    
    public init(snapshot: Snapshot) {
        self.snapshot = snapshot
    }
    
    public init(items: [YourJobEmployer]? = nil, nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "YourJobEmployerConnection", "items": items.flatMap { $0.map { $0.snapshot } }, "nextToken": nextToken])
    }
    
    public var __typename: String {
        get {
            return snapshot["__typename"]! as! String
        }
        set {
            snapshot.updateValue(newValue, forKey: "__typename")
        }
    }
    
    public var items: [YourJobEmployer]? {
        get {
            return (snapshot["items"] as? [Snapshot]).flatMap { $0.map { YourJobEmployer(snapshot: $0) } }
        }
        set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "items")
        }
    }
    
    public var nextToken: String? {
        get {
            return snapshot["nextToken"] as? String
        }
        set {
            snapshot.updateValue(newValue, forKey: "nextToken")
        }
    }
}
