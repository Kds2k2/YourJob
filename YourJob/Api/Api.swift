//  This file was automatically generated and should not be edited.

import AWSAppSync

public struct CreateYourJobEmployerInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(title: String, description: String? = nil, logoUrl: String? = nil, email: String? = nil, phone: String? = nil) {
    graphQLMap = ["title": title, "description": description, "logoUrl": logoUrl, "email": email, "phone": phone]
  }

  public var title: String {
    get {
      return graphQLMap["title"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
    }
  }

  public var description: String? {
    get {
      return graphQLMap["description"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "description")
    }
  }

  public var logoUrl: String? {
    get {
      return graphQLMap["logoUrl"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "logoUrl")
    }
  }

  public var email: String? {
    get {
      return graphQLMap["email"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  public var phone: String? {
    get {
      return graphQLMap["phone"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "phone")
    }
  }
}

public struct UpdateYourJobEmployerInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID, title: String, description: String? = nil, logoUrl: String? = nil, email: String? = nil, phone: String? = nil) {
    graphQLMap = ["id": id, "title": title, "description": description, "logoUrl": logoUrl, "email": email, "phone": phone]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var title: String {
    get {
      return graphQLMap["title"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
    }
  }

  public var description: String? {
    get {
      return graphQLMap["description"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "description")
    }
  }

  public var logoUrl: String? {
    get {
      return graphQLMap["logoUrl"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "logoUrl")
    }
  }

  public var email: String? {
    get {
      return graphQLMap["email"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  public var phone: String? {
    get {
      return graphQLMap["phone"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "phone")
    }
  }
}

public struct DeleteYourJobEmployerInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID) {
    graphQLMap = ["id": id]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }
}

public struct CreateYourJobVacancyInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(employerId: GraphQLID, category: YourJobCategory, title: String, description: String? = nil, salary: Int, location: String? = nil, isRemote: Bool) {
    graphQLMap = ["employerId": employerId, "category": category, "title": title, "description": description, "salary": salary, "location": location, "isRemote": isRemote]
  }

  public var employerId: GraphQLID {
    get {
      return graphQLMap["employerId"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "employerId")
    }
  }

  public var category: YourJobCategory {
    get {
      return graphQLMap["category"] as! YourJobCategory
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "category")
    }
  }

  public var title: String {
    get {
      return graphQLMap["title"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
    }
  }

  public var description: String? {
    get {
      return graphQLMap["description"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "description")
    }
  }

  public var salary: Int {
    get {
      return graphQLMap["salary"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "salary")
    }
  }

  public var location: String? {
    get {
      return graphQLMap["location"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "location")
    }
  }

  public var isRemote: Bool {
    get {
      return graphQLMap["isRemote"] as! Bool
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "isRemote")
    }
  }
}

public enum YourJobCategory: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  public typealias RawValue = String
  case serviceIndustries
  case salesAndPurchase
  case delivery
  case design
  case entertainment
  case engineering
  case informationTechnology
  case construction
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "ServiceIndustries": self = .serviceIndustries
      case "SalesAndPurchase": self = .salesAndPurchase
      case "Delivery": self = .delivery
      case "Design": self = .design
      case "Entertainment": self = .entertainment
      case "Engineering": self = .engineering
      case "InformationTechnology": self = .informationTechnology
      case "Construction": self = .construction
      default: self = .unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .serviceIndustries: return "ServiceIndustries"
      case .salesAndPurchase: return "SalesAndPurchase"
      case .delivery: return "Delivery"
      case .design: return "Design"
      case .entertainment: return "Entertainment"
      case .engineering: return "Engineering"
      case .informationTechnology: return "InformationTechnology"
      case .construction: return "Construction"
      case .unknown(let value): return value
    }
  }

  public static func == (lhs: YourJobCategory, rhs: YourJobCategory) -> Bool {
    switch (lhs, rhs) {
      case (.serviceIndustries, .serviceIndustries): return true
      case (.salesAndPurchase, .salesAndPurchase): return true
      case (.delivery, .delivery): return true
      case (.design, .design): return true
      case (.entertainment, .entertainment): return true
      case (.engineering, .engineering): return true
      case (.informationTechnology, .informationTechnology): return true
      case (.construction, .construction): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

public struct UpdateYourJobVacancyInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID, category: YourJobCategory, title: String, description: String? = nil, salary: Int, location: String? = nil, isRemote: Bool) {
    graphQLMap = ["id": id, "category": category, "title": title, "description": description, "salary": salary, "location": location, "isRemote": isRemote]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var category: YourJobCategory {
    get {
      return graphQLMap["category"] as! YourJobCategory
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "category")
    }
  }

  public var title: String {
    get {
      return graphQLMap["title"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
    }
  }

  public var description: String? {
    get {
      return graphQLMap["description"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "description")
    }
  }

  public var salary: Int {
    get {
      return graphQLMap["salary"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "salary")
    }
  }

  public var location: String? {
    get {
      return graphQLMap["location"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "location")
    }
  }

  public var isRemote: Bool {
    get {
      return graphQLMap["isRemote"] as! Bool
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "isRemote")
    }
  }
}

public struct DeleteYourJobVacancyInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID) {
    graphQLMap = ["id": id]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }
}

public struct ListYourJobEmployerFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: TableIDFilterInput? = nil, title: TableStringFilterInput? = nil, description: TableStringFilterInput? = nil, logoUrl: TableStringFilterInput? = nil, email: TableStringFilterInput? = nil, phone: TableStringFilterInput? = nil, createdAt: TableStringFilterInput? = nil, updatedAt: TableStringFilterInput? = nil) {
    graphQLMap = ["id": id, "title": title, "description": description, "logoUrl": logoUrl, "email": email, "phone": phone, "createdAt": createdAt, "updatedAt": updatedAt]
  }

  public var id: TableIDFilterInput? {
    get {
      return graphQLMap["id"] as! TableIDFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var title: TableStringFilterInput? {
    get {
      return graphQLMap["title"] as! TableStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
    }
  }

  public var description: TableStringFilterInput? {
    get {
      return graphQLMap["description"] as! TableStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "description")
    }
  }

  public var logoUrl: TableStringFilterInput? {
    get {
      return graphQLMap["logoUrl"] as! TableStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "logoUrl")
    }
  }

  public var email: TableStringFilterInput? {
    get {
      return graphQLMap["email"] as! TableStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  public var phone: TableStringFilterInput? {
    get {
      return graphQLMap["phone"] as! TableStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "phone")
    }
  }

  public var createdAt: TableStringFilterInput? {
    get {
      return graphQLMap["createdAt"] as! TableStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "createdAt")
    }
  }

  public var updatedAt: TableStringFilterInput? {
    get {
      return graphQLMap["updatedAt"] as! TableStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "updatedAt")
    }
  }
}

public struct TableIDFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: GraphQLID? = nil, eq: GraphQLID? = nil, le: GraphQLID? = nil, lt: GraphQLID? = nil, ge: GraphQLID? = nil, gt: GraphQLID? = nil, contains: GraphQLID? = nil, notContains: GraphQLID? = nil, between: [GraphQLID?]? = nil, beginsWith: GraphQLID? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "contains": contains, "notContains": notContains, "between": between, "beginsWith": beginsWith]
  }

  public var ne: GraphQLID? {
    get {
      return graphQLMap["ne"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: GraphQLID? {
    get {
      return graphQLMap["eq"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: GraphQLID? {
    get {
      return graphQLMap["le"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: GraphQLID? {
    get {
      return graphQLMap["lt"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: GraphQLID? {
    get {
      return graphQLMap["ge"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: GraphQLID? {
    get {
      return graphQLMap["gt"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var contains: GraphQLID? {
    get {
      return graphQLMap["contains"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "contains")
    }
  }

  public var notContains: GraphQLID? {
    get {
      return graphQLMap["notContains"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notContains")
    }
  }

  public var between: [GraphQLID?]? {
    get {
      return graphQLMap["between"] as! [GraphQLID?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }

  public var beginsWith: GraphQLID? {
    get {
      return graphQLMap["beginsWith"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "beginsWith")
    }
  }
}

public struct TableStringFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: String? = nil, eq: String? = nil, le: String? = nil, lt: String? = nil, ge: String? = nil, gt: String? = nil, contains: String? = nil, notContains: String? = nil, between: [String?]? = nil, beginsWith: String? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "contains": contains, "notContains": notContains, "between": between, "beginsWith": beginsWith]
  }

  public var ne: String? {
    get {
      return graphQLMap["ne"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: String? {
    get {
      return graphQLMap["eq"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: String? {
    get {
      return graphQLMap["le"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: String? {
    get {
      return graphQLMap["lt"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: String? {
    get {
      return graphQLMap["ge"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: String? {
    get {
      return graphQLMap["gt"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var contains: String? {
    get {
      return graphQLMap["contains"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "contains")
    }
  }

  public var notContains: String? {
    get {
      return graphQLMap["notContains"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notContains")
    }
  }

  public var between: [String?]? {
    get {
      return graphQLMap["between"] as! [String?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }

  public var beginsWith: String? {
    get {
      return graphQLMap["beginsWith"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "beginsWith")
    }
  }
}

public struct ListYourJobVacancyFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: TableIDFilterInput? = nil, or: [ListYourJobCategoryInput?]? = nil, title: TableStringFilterInput? = nil, description: TableStringFilterInput? = nil, salary: TableIntFilterInput? = nil, location: TableStringFilterInput? = nil, isRemote: TableBooleanFilterInput? = nil, createdAt: TableStringFilterInput? = nil, updatedAt: TableStringFilterInput? = nil) {
    graphQLMap = ["id": id, "or": or, "title": title, "description": description, "salary": salary, "location": location, "isRemote": isRemote, "createdAt": createdAt, "updatedAt": updatedAt]
  }

  public var id: TableIDFilterInput? {
    get {
      return graphQLMap["id"] as! TableIDFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var or: [ListYourJobCategoryInput?]? {
    get {
      return graphQLMap["or"] as! [ListYourJobCategoryInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var title: TableStringFilterInput? {
    get {
      return graphQLMap["title"] as! TableStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
    }
  }

  public var description: TableStringFilterInput? {
    get {
      return graphQLMap["description"] as! TableStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "description")
    }
  }

  public var salary: TableIntFilterInput? {
    get {
      return graphQLMap["salary"] as! TableIntFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "salary")
    }
  }

  public var location: TableStringFilterInput? {
    get {
      return graphQLMap["location"] as! TableStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "location")
    }
  }

  public var isRemote: TableBooleanFilterInput? {
    get {
      return graphQLMap["isRemote"] as! TableBooleanFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "isRemote")
    }
  }

  public var createdAt: TableStringFilterInput? {
    get {
      return graphQLMap["createdAt"] as! TableStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "createdAt")
    }
  }

  public var updatedAt: TableStringFilterInput? {
    get {
      return graphQLMap["updatedAt"] as! TableStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "updatedAt")
    }
  }
}

public struct ListYourJobCategoryInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(category: TableStringFilterInput? = nil) {
    graphQLMap = ["category": category]
  }

  public var category: TableStringFilterInput? {
    get {
      return graphQLMap["category"] as! TableStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "category")
    }
  }
}

public struct TableIntFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: Int? = nil, eq: Int? = nil, le: Int? = nil, lt: Int? = nil, ge: Int? = nil, gt: Int? = nil, contains: Int? = nil, notContains: Int? = nil, between: [Int?]? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "contains": contains, "notContains": notContains, "between": between]
  }

  public var ne: Int? {
    get {
      return graphQLMap["ne"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: Int? {
    get {
      return graphQLMap["eq"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: Int? {
    get {
      return graphQLMap["le"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: Int? {
    get {
      return graphQLMap["lt"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: Int? {
    get {
      return graphQLMap["ge"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: Int? {
    get {
      return graphQLMap["gt"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var contains: Int? {
    get {
      return graphQLMap["contains"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "contains")
    }
  }

  public var notContains: Int? {
    get {
      return graphQLMap["notContains"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notContains")
    }
  }

  public var between: [Int?]? {
    get {
      return graphQLMap["between"] as! [Int?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }
}

public struct TableBooleanFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: Bool? = nil, eq: Bool? = nil) {
    graphQLMap = ["ne": ne, "eq": eq]
  }

  public var ne: Bool? {
    get {
      return graphQLMap["ne"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: Bool? {
    get {
      return graphQLMap["eq"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }
}

public final class CreateYourJobEmployerMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateYourJobEmployer($input: CreateYourJobEmployerInput!) {\n  createYourJobEmployer(input: $input) {\n    __typename\n    id\n    title\n    description\n    logoUrl\n    email\n    phone\n    createdAt\n    updatedAt\n  }\n}"

  public var input: CreateYourJobEmployerInput

  public init(input: CreateYourJobEmployerInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createYourJobEmployer", arguments: ["input": GraphQLVariable("input")], type: .object(CreateYourJobEmployer.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createYourJobEmployer: CreateYourJobEmployer? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createYourJobEmployer": createYourJobEmployer.flatMap { $0.snapshot }])
    }

    public var createYourJobEmployer: CreateYourJobEmployer? {
      get {
        return (snapshot["createYourJobEmployer"] as? Snapshot).flatMap { CreateYourJobEmployer(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createYourJobEmployer")
      }
    }

    public struct CreateYourJobEmployer: GraphQLSelectionSet {
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
  }
}

public final class UpdateYourJobEmployerMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateYourJobEmployer($input: UpdateYourJobEmployerInput!) {\n  updateYourJobEmployer(input: $input) {\n    __typename\n    id\n    title\n    description\n    logoUrl\n    email\n    phone\n    createdAt\n    updatedAt\n  }\n}"

  public var input: UpdateYourJobEmployerInput

  public init(input: UpdateYourJobEmployerInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateYourJobEmployer", arguments: ["input": GraphQLVariable("input")], type: .object(UpdateYourJobEmployer.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateYourJobEmployer: UpdateYourJobEmployer? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateYourJobEmployer": updateYourJobEmployer.flatMap { $0.snapshot }])
    }

    public var updateYourJobEmployer: UpdateYourJobEmployer? {
      get {
        return (snapshot["updateYourJobEmployer"] as? Snapshot).flatMap { UpdateYourJobEmployer(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateYourJobEmployer")
      }
    }

    public struct UpdateYourJobEmployer: GraphQLSelectionSet {
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
  }
}

public final class DeleteYourJobEmployerMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteYourJobEmployer($input: DeleteYourJobEmployerInput!) {\n  deleteYourJobEmployer(input: $input) {\n    __typename\n    id\n    title\n    description\n    logoUrl\n    email\n    phone\n    createdAt\n    updatedAt\n  }\n}"

  public var input: DeleteYourJobEmployerInput

  public init(input: DeleteYourJobEmployerInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteYourJobEmployer", arguments: ["input": GraphQLVariable("input")], type: .object(DeleteYourJobEmployer.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteYourJobEmployer: DeleteYourJobEmployer? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteYourJobEmployer": deleteYourJobEmployer.flatMap { $0.snapshot }])
    }

    public var deleteYourJobEmployer: DeleteYourJobEmployer? {
      get {
        return (snapshot["deleteYourJobEmployer"] as? Snapshot).flatMap { DeleteYourJobEmployer(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteYourJobEmployer")
      }
    }

    public struct DeleteYourJobEmployer: GraphQLSelectionSet {
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
  }
}

public final class CreateYourJobVacancyMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateYourJobVacancy($input: CreateYourJobVacancyInput!) {\n  createYourJobVacancy(input: $input) {\n    __typename\n    id\n    employerId\n    employer {\n      __typename\n      id\n      title\n      description\n      logoUrl\n      email\n      phone\n      createdAt\n      updatedAt\n    }\n    category\n    title\n    description\n    salary\n    location\n    isRemote\n    createdAt\n    updatedAt\n  }\n}"

  public var input: CreateYourJobVacancyInput

  public init(input: CreateYourJobVacancyInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createYourJobVacancy", arguments: ["input": GraphQLVariable("input")], type: .object(CreateYourJobVacancy.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createYourJobVacancy: CreateYourJobVacancy? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createYourJobVacancy": createYourJobVacancy.flatMap { $0.snapshot }])
    }

    public var createYourJobVacancy: CreateYourJobVacancy? {
      get {
        return (snapshot["createYourJobVacancy"] as? Snapshot).flatMap { CreateYourJobVacancy(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createYourJobVacancy")
      }
    }

    public struct CreateYourJobVacancy: GraphQLSelectionSet {
      public static let possibleTypes = ["YourJobVacancy"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("employerId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("employer", type: .object(Employer.selections)),
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

      public init(id: GraphQLID, employerId: GraphQLID, employer: Employer? = nil, category: YourJobCategory, title: String, description: String? = nil, salary: Int, location: String? = nil, isRemote: Bool, createdAt: String, updatedAt: String) {
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

      public var employer: Employer? {
        get {
          return (snapshot["employer"] as? Snapshot).flatMap { Employer(snapshot: $0) }
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

      public struct Employer: GraphQLSelectionSet {
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
    }
  }
}

public final class UpdateYourJobVacancyMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateYourJobVacancy($input: UpdateYourJobVacancyInput!) {\n  updateYourJobVacancy(input: $input) {\n    __typename\n    id\n    employerId\n    employer {\n      __typename\n      id\n      title\n      description\n      logoUrl\n      email\n      phone\n      createdAt\n      updatedAt\n    }\n    category\n    title\n    description\n    salary\n    location\n    isRemote\n    createdAt\n    updatedAt\n  }\n}"

  public var input: UpdateYourJobVacancyInput

  public init(input: UpdateYourJobVacancyInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateYourJobVacancy", arguments: ["input": GraphQLVariable("input")], type: .object(UpdateYourJobVacancy.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateYourJobVacancy: UpdateYourJobVacancy? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateYourJobVacancy": updateYourJobVacancy.flatMap { $0.snapshot }])
    }

    public var updateYourJobVacancy: UpdateYourJobVacancy? {
      get {
        return (snapshot["updateYourJobVacancy"] as? Snapshot).flatMap { UpdateYourJobVacancy(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateYourJobVacancy")
      }
    }

    public struct UpdateYourJobVacancy: GraphQLSelectionSet {
      public static let possibleTypes = ["YourJobVacancy"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("employerId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("employer", type: .object(Employer.selections)),
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

      public init(id: GraphQLID, employerId: GraphQLID, employer: Employer? = nil, category: YourJobCategory, title: String, description: String? = nil, salary: Int, location: String? = nil, isRemote: Bool, createdAt: String, updatedAt: String) {
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

      public var employer: Employer? {
        get {
          return (snapshot["employer"] as? Snapshot).flatMap { Employer(snapshot: $0) }
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

      public struct Employer: GraphQLSelectionSet {
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
    }
  }
}

public final class DeleteYourJobVacancyMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteYourJobVacancy($input: DeleteYourJobVacancyInput!) {\n  deleteYourJobVacancy(input: $input) {\n    __typename\n    id\n    employerId\n    employer {\n      __typename\n      id\n      title\n      description\n      logoUrl\n      email\n      phone\n      createdAt\n      updatedAt\n    }\n    category\n    title\n    description\n    salary\n    location\n    isRemote\n    createdAt\n    updatedAt\n  }\n}"

  public var input: DeleteYourJobVacancyInput

  public init(input: DeleteYourJobVacancyInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteYourJobVacancy", arguments: ["input": GraphQLVariable("input")], type: .object(DeleteYourJobVacancy.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteYourJobVacancy: DeleteYourJobVacancy? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteYourJobVacancy": deleteYourJobVacancy.flatMap { $0.snapshot }])
    }

    public var deleteYourJobVacancy: DeleteYourJobVacancy? {
      get {
        return (snapshot["deleteYourJobVacancy"] as? Snapshot).flatMap { DeleteYourJobVacancy(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteYourJobVacancy")
      }
    }

    public struct DeleteYourJobVacancy: GraphQLSelectionSet {
      public static let possibleTypes = ["YourJobVacancy"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("employerId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("employer", type: .object(Employer.selections)),
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

      public init(id: GraphQLID, employerId: GraphQLID, employer: Employer? = nil, category: YourJobCategory, title: String, description: String? = nil, salary: Int, location: String? = nil, isRemote: Bool, createdAt: String, updatedAt: String) {
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

      public var employer: Employer? {
        get {
          return (snapshot["employer"] as? Snapshot).flatMap { Employer(snapshot: $0) }
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

      public struct Employer: GraphQLSelectionSet {
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
    }
  }
}

public final class GetYourJobEmployerQuery: GraphQLQuery {
  public static let operationString =
    "query GetYourJobEmployer($id: ID!) {\n  getYourJobEmployer(id: $id) {\n    __typename\n    id\n    title\n    description\n    logoUrl\n    email\n    phone\n    createdAt\n    updatedAt\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getYourJobEmployer", arguments: ["id": GraphQLVariable("id")], type: .object(GetYourJobEmployer.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getYourJobEmployer: GetYourJobEmployer? = nil) {
      self.init(snapshot: ["__typename": "Query", "getYourJobEmployer": getYourJobEmployer.flatMap { $0.snapshot }])
    }

    public var getYourJobEmployer: GetYourJobEmployer? {
      get {
        return (snapshot["getYourJobEmployer"] as? Snapshot).flatMap { GetYourJobEmployer(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getYourJobEmployer")
      }
    }

    public struct GetYourJobEmployer: GraphQLSelectionSet {
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
  }
}

public final class ListYourJobEmployersQuery: GraphQLQuery {
  public static let operationString =
    "query ListYourJobEmployers($filter: ListYourJobEmployerFilterInput, $limit: Int, $nextToken: String) {\n  listYourJobEmployers(filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      title\n      description\n      logoUrl\n      email\n      phone\n      createdAt\n      updatedAt\n    }\n    nextToken\n  }\n}"

  public var filter: ListYourJobEmployerFilterInput?
  public var limit: Int?
  public var nextToken: String?

  public init(filter: ListYourJobEmployerFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["filter": filter, "limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listYourJobEmployers", arguments: ["filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(ListYourJobEmployer.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listYourJobEmployers: ListYourJobEmployer? = nil) {
      self.init(snapshot: ["__typename": "Query", "listYourJobEmployers": listYourJobEmployers.flatMap { $0.snapshot }])
    }

    public var listYourJobEmployers: ListYourJobEmployer? {
      get {
        return (snapshot["listYourJobEmployers"] as? Snapshot).flatMap { ListYourJobEmployer(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listYourJobEmployers")
      }
    }

    public struct ListYourJobEmployer: GraphQLSelectionSet {
      public static let possibleTypes = ["YourJobEmployerConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .list(.nonNull(.object(Item.selections)))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item]? = nil, nextToken: String? = nil) {
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

      public var items: [Item]? {
        get {
          return (snapshot["items"] as? [Snapshot]).flatMap { $0.map { Item(snapshot: $0) } }
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

      public struct Item: GraphQLSelectionSet {
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
    }
  }
}

public final class GetYourJobVacancyQuery: GraphQLQuery {
  public static let operationString =
    "query GetYourJobVacancy($id: ID!) {\n  getYourJobVacancy(id: $id) {\n    __typename\n    id\n    employerId\n    employer {\n      __typename\n      id\n      title\n      description\n      logoUrl\n      email\n      phone\n      createdAt\n      updatedAt\n    }\n    category\n    title\n    description\n    salary\n    location\n    isRemote\n    createdAt\n    updatedAt\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getYourJobVacancy", arguments: ["id": GraphQLVariable("id")], type: .object(GetYourJobVacancy.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getYourJobVacancy: GetYourJobVacancy? = nil) {
      self.init(snapshot: ["__typename": "Query", "getYourJobVacancy": getYourJobVacancy.flatMap { $0.snapshot }])
    }

    public var getYourJobVacancy: GetYourJobVacancy? {
      get {
        return (snapshot["getYourJobVacancy"] as? Snapshot).flatMap { GetYourJobVacancy(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getYourJobVacancy")
      }
    }

    public struct GetYourJobVacancy: GraphQLSelectionSet {
      public static let possibleTypes = ["YourJobVacancy"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("employerId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("employer", type: .object(Employer.selections)),
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

      public init(id: GraphQLID, employerId: GraphQLID, employer: Employer? = nil, category: YourJobCategory, title: String, description: String? = nil, salary: Int, location: String? = nil, isRemote: Bool, createdAt: String, updatedAt: String) {
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

      public var employer: Employer? {
        get {
          return (snapshot["employer"] as? Snapshot).flatMap { Employer(snapshot: $0) }
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

      public struct Employer: GraphQLSelectionSet {
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
    }
  }
}

public final class ListYourJobVacanciesQuery: GraphQLQuery {
  public static let operationString =
    "query ListYourJobVacancies($filter: ListYourJobVacancyFilterInput, $limit: Int, $nextToken: String) {\n  listYourJobVacancies(filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      employerId\n      employer {\n        __typename\n        id\n        title\n        description\n        logoUrl\n        email\n        phone\n        createdAt\n        updatedAt\n      }\n      category\n      title\n      description\n      salary\n      location\n      isRemote\n      createdAt\n      updatedAt\n    }\n    nextToken\n  }\n}"

  public var filter: ListYourJobVacancyFilterInput?
  public var limit: Int?
  public var nextToken: String?

  public init(filter: ListYourJobVacancyFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["filter": filter, "limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listYourJobVacancies", arguments: ["filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(ListYourJobVacancy.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listYourJobVacancies: ListYourJobVacancy? = nil) {
      self.init(snapshot: ["__typename": "Query", "listYourJobVacancies": listYourJobVacancies.flatMap { $0.snapshot }])
    }

    public var listYourJobVacancies: ListYourJobVacancy? {
      get {
        return (snapshot["listYourJobVacancies"] as? Snapshot).flatMap { ListYourJobVacancy(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listYourJobVacancies")
      }
    }

    public struct ListYourJobVacancy: GraphQLSelectionSet {
      public static let possibleTypes = ["YourJobVacancyConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .list(.nonNull(.object(Item.selections)))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item]? = nil, nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "YourJobVacancyConnection", "items": items.flatMap { $0.map { $0.snapshot } }, "nextToken": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item]? {
        get {
          return (snapshot["items"] as? [Snapshot]).flatMap { $0.map { Item(snapshot: $0) } }
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

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["YourJobVacancy"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("employerId", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("employer", type: .object(Employer.selections)),
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

        public init(id: GraphQLID, employerId: GraphQLID, employer: Employer? = nil, category: YourJobCategory, title: String, description: String? = nil, salary: Int, location: String? = nil, isRemote: Bool, createdAt: String, updatedAt: String) {
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

        public var employer: Employer? {
          get {
            return (snapshot["employer"] as? Snapshot).flatMap { Employer(snapshot: $0) }
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

        public struct Employer: GraphQLSelectionSet {
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
      }
    }
  }
}

public final class OnMutateYourJobEmployerSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnMutateYourJobEmployer($id: ID) {\n  onMutateYourJobEmployer(id: $id) {\n    __typename\n    id\n    title\n    description\n    logoUrl\n    email\n    phone\n    createdAt\n    updatedAt\n  }\n}"

  public var id: GraphQLID?

  public init(id: GraphQLID? = nil) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onMutateYourJobEmployer", arguments: ["id": GraphQLVariable("id")], type: .object(OnMutateYourJobEmployer.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onMutateYourJobEmployer: OnMutateYourJobEmployer? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onMutateYourJobEmployer": onMutateYourJobEmployer.flatMap { $0.snapshot }])
    }

    public var onMutateYourJobEmployer: OnMutateYourJobEmployer? {
      get {
        return (snapshot["onMutateYourJobEmployer"] as? Snapshot).flatMap { OnMutateYourJobEmployer(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onMutateYourJobEmployer")
      }
    }

    public struct OnMutateYourJobEmployer: GraphQLSelectionSet {
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
  }
}

public final class OnMutateYourJobVacancySubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnMutateYourJobVacancy($id: ID) {\n  onMutateYourJobVacancy(id: $id) {\n    __typename\n    id\n    employerId\n    employer {\n      __typename\n      id\n      title\n      description\n      logoUrl\n      email\n      phone\n      createdAt\n      updatedAt\n    }\n    category\n    title\n    description\n    salary\n    location\n    isRemote\n    createdAt\n    updatedAt\n  }\n}"

  public var id: GraphQLID?

  public init(id: GraphQLID? = nil) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onMutateYourJobVacancy", arguments: ["id": GraphQLVariable("id")], type: .object(OnMutateYourJobVacancy.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onMutateYourJobVacancy: OnMutateYourJobVacancy? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onMutateYourJobVacancy": onMutateYourJobVacancy.flatMap { $0.snapshot }])
    }

    public var onMutateYourJobVacancy: OnMutateYourJobVacancy? {
      get {
        return (snapshot["onMutateYourJobVacancy"] as? Snapshot).flatMap { OnMutateYourJobVacancy(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onMutateYourJobVacancy")
      }
    }

    public struct OnMutateYourJobVacancy: GraphQLSelectionSet {
      public static let possibleTypes = ["YourJobVacancy"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("employerId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("employer", type: .object(Employer.selections)),
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

      public init(id: GraphQLID, employerId: GraphQLID, employer: Employer? = nil, category: YourJobCategory, title: String, description: String? = nil, salary: Int, location: String? = nil, isRemote: Bool, createdAt: String, updatedAt: String) {
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

      public var employer: Employer? {
        get {
          return (snapshot["employer"] as? Snapshot).flatMap { Employer(snapshot: $0) }
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

      public struct Employer: GraphQLSelectionSet {
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
    }
  }
}