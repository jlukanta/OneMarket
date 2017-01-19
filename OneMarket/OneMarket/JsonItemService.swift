//
//  JsonItemService.swift
//  OneMarket
//
//  Created by James Lukanta on 1/18/17.
//  Copyright © 2017 Flying Jar Inc. All rights reserved.
//

import UIKit

class JsonItemService: NSObject, ItemService {
  let defaults = UserDefaults.standard
  
  func createItem() -> Item {
    return Item(id : UUID().uuidString)
  }
  
  func day(_ date: Date?) -> Date {
    let date = date ?? Date.distantFuture
    return Calendar.current.startOfDay(for: date)
  }
  
  func key(_ date: Date?) -> String {
    let dayInt = Int(day(date).timeIntervalSince1970)
    let dayKey = "om \(dayInt)"
    return dayKey
  }
  
  func saveItem(item: Item) {
    let key = self.key(item.date)
    var items = UserDefaults.standard.array(forKey: key) ?? []
    items.append(item)
    UserDefaults.standard.set(items, forKey: key)
  }
  
  func deleteItem(item: Item) {
    let key = self.key(item.date)
    var items = UserDefaults.standard.array(forKey: key) ?? []
    items = items.filter { (obj) -> Bool in
      guard let itemDict = obj as? [String: Any] else {
        return false
      }
      guard let storedId = itemDict["id"] as? String else {
        return false
      }
      return storedId != item.id
    }
    UserDefaults.standard.set(items, forKey: key)
  }
  
  func getItems(day: Date?) -> [Item] {
    let key = self.key(day)
    return UserDefaults.standard.array(forKey: key) as? [Item] ?? []
  }
  
  func getItem(id: String) -> Item? {
    return Item(id : "test")
  }
}
