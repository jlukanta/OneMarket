import Foundation

class Item {
  public var id:String
  public var name:String?
  public var location:String?
  public var date:Date?
  
  init(id : String) {
    self.id = id
  }
  
  func dict() -> [String : Any?] {
    return [
      "id" : id,
      "name" : name,
      "location" : location,
      "date" : date,
    ]
  }
}
