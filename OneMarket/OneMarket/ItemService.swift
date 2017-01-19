import Foundation

protocol ItemService {
  // Create an item template (but not save it)
  func createItem() -> Item
  
  // Persist item into storage
  func saveItem(item: Item)
  
  // Delete an item from storage
  func deleteItem(item: Item)

  // Get an array of all items
  func getItems(day:Date?) -> [Item]
  
  // Get a single item
  func getItem(id:String) -> Item?
}
