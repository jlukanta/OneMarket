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
}
