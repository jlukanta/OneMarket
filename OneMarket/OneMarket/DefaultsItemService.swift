import UIKit

class DefaultsItemService: NSObject, ItemService {
  let defaults = UserDefaults.standard
  
  func createItem() -> Item {
    return Item(id : UUID().uuidString)
  }
  
  // Ids helper
  
  func day(_ date: Date?) -> Date {
    let date = date ?? Date.distantFuture
    return Calendar.current.startOfDay(for: date)
  }
  
  func idsKey(_ date: Date?) -> String {
    let dayInt = Int(day(date).timeIntervalSince1970)
    let dayKey = "om.day.\(dayInt)"
    return dayKey
  }
  
  func getIds(_ date: Date?) -> [String] {
    let key = self.idsKey(date)
    return UserDefaults.standard.array(forKey: key) as? [String] ?? []
  }
  
  func setIds(ids: [String], date: Date?) {
    UserDefaults.standard.set(ids, forKey: idsKey(date))
  }
  
  func addId(item: Item) {
    var ids = getIds(item.date)
    ids.append(item.id)
    setIds(ids: ids, date: item.date)
  }
  
  func delId(item: Item) {
    let ids = getIds(item.date).filter { (storedId: String) -> Bool in
      return storedId != item.id
    }
    setIds(ids: ids, date: item.date)
  }
  
  // Info helper
  
  func infoKey(_ id: String) -> String {
    return "om.item.\(id)";
  }
  
  func getInfo(id: String) -> [String: Any]? {
    return UserDefaults.standard.dictionary(forKey: infoKey(id))
  }
  
  func setInfo(item: Item) {
    UserDefaults.standard.set(item.dict(), forKey: infoKey(item.id))
  }
  
  func delInfo(id: String) {
    UserDefaults.standard.removeObject(forKey: infoKey(id))
  }
  
  // Save Item
  
  func saveItem(item: Item) {
    addId(item: item)
    setInfo(item: item)
  }
  
  // Delete Item
  
  func deleteItem(item: Item) {
    delId(item: item)
    delInfo(id: item.id)
  }
  
  // Get Items
  
  func getItems(day: Date?) -> [Item] {
    let ids = getIds(day)
    var items : [Item] = []
    for id in ids {
      guard let item = getItem(id: id) else {
        continue
      }
      items.append(item)
    }
    return items
  }
  
  // Get Item
  
  func getItem(id: String) -> Item? {
    guard let info = getInfo(id: id) else {
      return nil
    }
    return Item.makeFromDict(info)
  }
  
  // Get a (sorted) array of dates that have items assigned to them
  func getAssignedDates () -> [Date] {
    return [] // [TODO] Implement this
  }
}
