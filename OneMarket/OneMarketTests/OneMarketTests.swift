import XCTest
@testable import OneMarket

class DefaultsItemServiceTests: XCTestCase {
  let service = DefaultsItemService()
  
  override func setUp() {
    super.setUp()
    
    // Reset UserDefaults
    if let bundle = Bundle.main.bundleIdentifier {
      UserDefaults.standard.removePersistentDomain(forName: bundle)
    }
  }
  
  func testCreateAndGetItem() {
    let service = DefaultsItemService()
    
    let newItem = service.createItem()
    newItem.name = "Test item"
    newItem.location = "Test location"
    newItem.date = Date(timeIntervalSince1970: 12345)
    service.saveItem(item: newItem)
    
    let item = service.getItem(id: newItem.id)!
    XCTAssert(!item.id.isEmpty)
    XCTAssert(item.name == "Test item")
    XCTAssert(item.location == "Test location")
    XCTAssert(item.date == Date(timeIntervalSince1970: 12345))
  }
  
  func testUpdateItem() {
    let service = DefaultsItemService()
    
    let item = service.createItem()
    item.name = "Test item"
    item.date = Date(timeIntervalSince1970: 12345)
    service.saveItem(item: item)
    
    item.name = "New name"
    service.saveItem(item: item)
    
    XCTAssert(service.getItem(id: item.id)!.name == "New name")
  }
  
  func testDeleteItem() {
    let service = DefaultsItemService()
    
    let item = service.createItem()
    item.date = Date(timeIntervalSince1970: 12345)
    service.saveItem(item: item)
    service.deleteItem(item: item)
    
    XCTAssert(service.getItem(id: item.id) == nil)
  }
  
  func testGetItemsSortedByName() {
    let service = DefaultsItemService()
    
    let item1 = service.createItem()
    item1.date = Date(timeIntervalSince1970: 12345)
    item1.name = "1"
    service.saveItem(item: item1)
    
    let item2 = service.createItem()
    item2.name = "2"
    item2.date = Date(timeIntervalSince1970: 12345)
    service.saveItem(item: item2)
    
    let items = service.getItemsSortedByName(day: Date(timeIntervalSince1970: 12345))
    XCTAssert(items[0].id == item1.id)
    XCTAssert(items[1].id == item2.id)
    XCTAssert(items.count == 2)
  }
  
  func testGetAssignedDates() {
    let service = DefaultsItemService()
    
    let item1 = service.createItem()
    item1.name = "Test item 1"
    item1.date = Date(timeIntervalSince1970: 12345)
    service.saveItem(item: item1)
    
    let item2 = service.createItem()
    item2.name = "Test item 2"
    item2.date = Date(timeIntervalSince1970: 4567)
    service.saveItem(item: item2)
    
    let item3 = service.createItem()
    item3.name = "Test item 3"
    service.saveItem(item: item3)
    
    let dates = service.getAssignedDates()
    XCTAssert(dates[0] == Date(timeIntervalSince1970: 12345))
    XCTAssert(dates[1] == Date(timeIntervalSince1970: 4567))
    XCTAssert(dates[2] == Date.distantFuture)
  }
}
