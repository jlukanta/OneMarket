import Foundation

// Manages items
protocol ItemService: class {
  // Create an item template (but not save it)
  func createItem() -> Item
  
  // Persist item into storage
  func saveItem(item: Item)
  
  // Delete an item by id
  func deleteItem(id: String)
  
  // Delete an item from storage
  func deleteItem(item: Item)

  // Get an array of all items sorted by name
  func getItemsSortedByName(day: Date?) -> [Item]
  
  // Get a single item
  func getItem(id:String) -> Item?
  
  // Get a (sorted) array of dates that have items assigned to them
  func getAssignedDates () -> [Date]
}
