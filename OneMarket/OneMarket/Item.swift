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
  
  // Get a dictionary representation of this item
  func dict() -> [String : Any?] {
    return [
      "id" : id,
      "name" : name,
      "location" : location,
      "date" : date,
    ]
  }
}
