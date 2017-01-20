import XCTest
@testable import OneMarket

class DefaultsItemServiceTests: XCTestCase {
  let service = DefaultsItemService()
  
  override func setUp() {
    super.setUp()
    clearData()
  }
  
  override func tearDown() {
    super.tearDown()
    clearData()
  }
  
  func clearData () {
    // Reset UserDefaults
    if let bundle = Bundle.main.bundleIdentifier {
      UserDefaults.standard.removePersistentDomain(forName: bundle)
    }
  }
  
  func testCreateAndGetItem() {
    let service = DefaultsItemService()
    let date = Calendar.current.startOfDay(for:Date(timeIntervalSince1970: 123450000))
    
    let newItem = service.createItem()
    newItem.name = "Test item"
    newItem.location = "Test location"
    newItem.date = date
    service.saveItem(item: newItem)
    
    let item = service.getItem(id: newItem.id)!
    XCTAssert(!item.id.isEmpty)
    XCTAssert(item.name == "Test item")
    XCTAssert(item.location == "Test location")
    XCTAssert(item.date == date)
  }
  
  func testUpdateItem() {
    let service = DefaultsItemService()
    
    let item = service.createItem()
    item.name = "Test item"
    item.date = Date(timeIntervalSince1970: 123450000)
    service.saveItem(item: item)
    
    item.name = "New name"
    service.saveItem(item: item)
    
    XCTAssert(service.getItem(id: item.id)!.name == "New name")
  }
  
  func testDeleteItem() {
    let service = DefaultsItemService()
    
    let item = service.createItem()
    item.date = Date(timeIntervalSince1970: 123450000)
    service.saveItem(item: item)
    service.deleteItem(item: item)
    
    XCTAssert(service.getItem(id: item.id) == nil)
  }
  
  func testGetItemsSortedByName() {
    let service = DefaultsItemService()
    let date = Calendar.current.startOfDay(for:Date(timeIntervalSince1970: 123450000))
    
    let item1 = service.createItem()
    item1.date = date
    item1.name = "1"
    service.saveItem(item: item1)
    
    let item2 = service.createItem()
    item2.name = "2"
    item2.date = date
    service.saveItem(item: item2)
    
    let items = service.getItemsSortedByName(day: Date(timeIntervalSince1970: 123450000))
    XCTAssert(items[0].id == item1.id)
    XCTAssert(items[1].id == item2.id)
    XCTAssert(items.count == 2)
  }
  
  func testGetAssignedDates() {
    let service = DefaultsItemService()
    let date1 = Calendar.current.startOfDay(for:Date(timeIntervalSince1970: 123450000))
    let date2 = Calendar.current.startOfDay(for:Date(timeIntervalSince1970: 456700000))
    
    let item1 = service.createItem()
    item1.name = "Test item 1"
    item1.date = date1
    service.saveItem(item: item1)
    
    let item2 = service.createItem()
    item2.name = "Test item 2"
    item2.date = date2
    service.saveItem(item: item2)
    
    let item3 = service.createItem()
    item3.name = "Test item 3"
    service.saveItem(item: item3)
    
    let dates = service.getAssignedDates()
    
    XCTAssert(dates[0] == date1)
    XCTAssert(dates[1] == date2)
    XCTAssert(dates[2] == Date.distantFuture)
  }
}
