import Foundation

class FakeItemService: ItemService {
  let totalFakeItems = 20
  let items = Set<NSHashTable<Item>>()
  
  init () {

    // Produce fake items
    for _ in 0 ..< totalFakeItems {
      let fakeItem = self.createItem()
      fakeItem.id = NSUUID().uuidString
      fakeItem.date = Date()
    }
  }
  
  func createItem() -> Item {
    
    // Provide ID and default date
    let item = Item(id: NSUUID().uuidString)
    item.date = Date()
    
    return item
  }
  
  func saveItem(item: Item) {
    // Do nothing
  }
  
  func deleteItem(item: Item) {
    // Do nothing
  }
  
  func getItems() -> [Item] {
    return [Item]()
  }
  
  func getItem(id:String) -> Item {
    return nil
  }
}
