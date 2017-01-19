import UIKit

class DefaultsItemService: NSObject, ItemService {
  let defaults = UserDefaults.standard
  
  // Item Helpers
  
  func makeItem(dict: [String: Any]) -> Item? {
    guard let id = dict["id"] as? String else {
      return nil
    }
    let item = Item(id: id)
    item.name = dict["name"] as? String
    item.location = dict["location"] as? String
    item.date = dict["date"] as? Date
    return item
  }
  
  func itemToDict(item: Item) -> [String: Any] {
    var dict : [String : Any] = [:]
    dict["id"]       = item.id
    dict["name"]     = item.name
    dict["location"] = item.location
    dict["date"]     = item.date
    return dict
  }
  
  // Dates helper
  
  func datesKey() -> String {
    return "om.dates"
  }
  
  func getDates() -> [Date] {
    return UserDefaults.standard.array(forKey: datesKey()) as? [Date] ?? []
  }
  
  func setDates(dates: [Date]) {
    UserDefaults.standard.set(dates, forKey: datesKey())
  }
  
  func addDate(_ date: Date?) {
    let date = date ?? Date.distantFuture
    let dates = getDates()
    guard !dates.contains(date) else {
      return;
    }
    setDates(dates: dates)
  }
  
  func delDate(_ date: Date?) {
    let date = date ?? Date.distantFuture
    var dates = getDates()
    guard let index = dates.index(of: date) else {
      return;
    }
    dates.remove(at: index)
    setDates(dates: dates)
  }
  
  // Ids helper
  
  func day(_ date: Date?) -> Date {
    let date = date ?? Date.distantFuture
    return Calendar.current.startOfDay(for: date)
  }
  
  func idsKey(_ date: Date?) -> String {
    let dayInt = Int(day(date).timeIntervalSince1970)
    let dayKey = "om.ids.\(dayInt)"
    return dayKey
  }
  
  func getIds(_ date: Date?) -> [String] {
    let key = self.idsKey(date)
    return UserDefaults.standard.array(forKey: key) as? [String] ?? []
  }
  
  func setIds(ids: [String], date: Date?) {
    UserDefaults.standard.set(ids, forKey: idsKey(date))
  }
  
  func addId(item: Item) -> Int {
    var ids = getIds(item.date)
    ids.append(item.id)
    setIds(ids: ids, date: item.date)
    return ids.count
  }
  
  func delId(item: Item) -> Int {
    let ids = getIds(item.date).filter { (storedId: String) -> Bool in
      return storedId != item.id
    }
    setIds(ids: ids, date: item.date)
    return ids.count
  }
  
  // Info helper
  
  func infoKey(_ id: String) -> String {
    return "om.info.\(id)";
  }
  
  func getInfo(id: String) -> [String: Any]? {
    return UserDefaults.standard.dictionary(forKey: infoKey(id))
  }
  
  func setInfo(item: Item) {
    UserDefaults.standard.set(itemToDict(item: item), forKey: infoKey(item.id))
  }
  
  func delInfo(id: String) {
    UserDefaults.standard.removeObject(forKey: infoKey(id))
  }
  
  // Create Item
  
  func createItem() -> Item {
    return Item(id : UUID().uuidString)
  }
  
  // Save Item
  
  func saveItem(item: Item) {
    if addId(item: item) == 1 {
      addDate(item.date)
    }
    setInfo(item: item)
  }
  
  // Delete Item
  
  func deleteItem(item: Item) {
    if delId(item: item) <= 0 {
      delDate(item.date)
    }
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
  
  func getItemsSortedByName(day: Date?) -> [Item] {
    return getItems(day: day).sorted(by: { (item1: Item, item2: Item) -> Bool in
      return item1.name ?? "" <= item2.name ?? ""
    })
  }
  
  // Get Item
  
  func getItem(id: String) -> Item? {
    guard let info = getInfo(id: id) else {
      return nil
    }
    return makeItem(dict: info)
  }
  
  // Get a (sorted) array of dates that have items assigned to them
  func getAssignedDates () -> [Date] {
    return getDates().sorted()
  }
}
