//
//  YourJobEmployer.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 11.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import Foundation
import AWSAppSync

public struct YourJobEmployer: GraphQLSelectionSet {
  public static let possibleTypes = ["YourJobEmployer"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("title", type: .nonNull(.scalar(String.self))),
    GraphQLField("description", type: .scalar(String.self)),
    GraphQLField("logoUrl", type: .scalar(String.self)),
    GraphQLField("email", type: .scalar(String.self)),
    GraphQLField("phone", type: .scalar(String.self)),
    GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
    GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: GraphQLID, title: String, description: String? = nil, logoUrl: String? = nil, email: String? = nil, phone: String? = nil, createdAt: String, updatedAt: String) {
    self.init(snapshot: ["__typename": "YourJobEmployer", "id": id, "title": title, "description": description, "logoUrl": logoUrl, "email": email, "phone": phone, "createdAt": createdAt, "updatedAt": updatedAt])
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

  public var logoUrl: String? {
    get {
      return snapshot["logoUrl"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "logoUrl")
    }
  }

  public var email: String? {
    get {
      return snapshot["email"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "email")
    }
  }

  public var phone: String? {
    get {
      return snapshot["phone"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "phone")
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
