//
//  YourJobVacancy.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 11.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import Foundation
import AWSAppSync

public struct YourJobVacancy: GraphQLSelectionSet {
    public static let possibleTypes = ["YourJobVacancy"]
    
    public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("employerId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("employer", type: .object(YourJobEmployer.selections)),
        GraphQLField("category", type: .nonNull(.scalar(YourJobCategory.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("salary", type: .nonNull(.scalar(Int.self))),
        GraphQLField("location", type: .scalar(String.self)),
        GraphQLField("isRemote", type: .nonNull(.scalar(Bool.self))),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
    ]
    
    public var snapshot: Snapshot
    
    public init(snapshot: Snapshot) {
        self.snapshot = snapshot
    }
    
    public init(id: GraphQLID, employerId: GraphQLID, employer: YourJobEmployer? = nil, category: YourJobCategory, title: String, description: String? = nil, salary: Int, location: String? = nil, isRemote: Bool, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "YourJobVacancy", "id": id, "employerId": employerId, "employer": employer.flatMap { $0.snapshot }, "category": category, "title": title, "description": description, "salary": salary, "location": location, "isRemote": isRemote, "createdAt": createdAt, "updatedAt": updatedAt])
    }
    
    public var __typename: String {
        get {
            return snapshot["__typename"]! as! String
        }
        set {
            snapshot.updateValue(newValue, forKey: "__typename")
        }
    }
    
    public var id: GraphQLID {
        get {
            return snapshot["id"]! as! GraphQLID
        }
        set {
            snapshot.updateValue(newValue, forKey: "id")
        }
    }
    
    public var employerId: GraphQLID {
        get {
            return snapshot["employerId"]! as! GraphQLID
        }
        set {
            snapshot.updateValue(newValue, forKey: "employerId")
        }
    }
    
    public var employer: YourJobEmployer? {
        get {
            return (snapshot["employer"] as? Snapshot).flatMap { YourJobEmployer(snapshot: $0) }
        }
        set {
            snapshot.updateValue(newValue?.snapshot, forKey: "employer")
        }
    }
    
    public var category: YourJobCategory {
        get {
            return snapshot["category"]! as! YourJobCategory
        }
        set {
            snapshot.updateValue(newValue, forKey: "category")
        }
    }
    
    public var title: String {
        get {
            return snapshot["title"]! as! String
        }
        set {
            snapshot.updateValue(newValue, forKey: "title")
        }
    }
    
    public var description: String? {
        get {
            return snapshot["description"] as? String
        }
        set {
            snapshot.updateValue(newValue, forKey: "description")
        }
    }
    
    public var salary: Int {
        get {
            return snapshot["salary"]! as! Int
        }
        set {
            snapshot.updateValue(newValue, forKey: "salary")
        }
    }
    
    public var location: String? {
        get {
            return snapshot["location"] as? String
        }
        set {
            snapshot.updateValue(newValue, forKey: "location")
        }
    }
    
    public var isRemote: Bool {
        get {
            return snapshot["isRemote"]! as! Bool
        }
        set {
            snapshot.updateValue(newValue, forKey: "isRemote")
        }
    }
    
    public var createdAt: String {
        get {
            return snapshot["createdAt"]! as! String
        }
        set {
            snapshot.updateValue(newValue, forKey: "createdAt")
        }
    }
    
    public var updatedAt: String {
        get {
            return snapshot["updatedAt"]! as! String
        }
        set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
        }
    }
}
