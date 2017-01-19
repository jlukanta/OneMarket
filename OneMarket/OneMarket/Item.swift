import Foundation

class Item {
  public var id:String
  public var name:String?
  public var location:String?
  public var date:Date?
  
  // Initialize new item
  init(id : String) {
    self.id = id
  }
  
  static func makeFromDict(_ dict : [String: Any]) -> Item? {
    guard let id = dict["id"] as? String else {
      return nil
    }
    let item = Item(id: id)
    item.name = dict["name"] as? String
    item.location = dict["location"] as? String
    item.date = dict["date"] as? Date
    return item
  }
  
  // Get a dictionary representation of this item
  func dict() -> [String : Any] {
    var dict : [String : Any] = ["id" : id]
    if name != nil {
      dict["name"] = name
    }
    if location != nil {
      dict["location"] = location
    }
    if date != nil {
      dict["date"] = date
    }
    return dict
  }
}
