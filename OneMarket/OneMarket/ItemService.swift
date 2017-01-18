import Foundation

protocol ItemService {
  func saveItem(item: Item)
  func deleteItem(item: Item)
  func getItems() -> [Item]
}
