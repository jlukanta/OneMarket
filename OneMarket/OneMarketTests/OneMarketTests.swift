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
  
  override func tearDown() {
    super.tearDown()
  }
  
  func testAddItem() {
    let service = DefaultsItemService()
    
    let item1 = service.createItem()
    item1.name = "Test Item 1"
    item1.date = Date(timeIntervalSince1970: 0)
    service.saveItem(item: item1)
    
    let item2 = service.createItem()
    item2.name = "Test Item 2"
    item2.date = Date(timeIntervalSinceReferenceDate: 0)
    item2.location = "Safeway"
    service.saveItem(item: item2)
    
    let item3 = service.createItem()
    item3.name = "Test Item 3"
    service.saveItem(item: item3)
    
    let fetched1 = service.getItem(id: item1.id)
    let fetched2 = service.getItem(id: item2.id)
    let fetched3 = service.getItem(id: item3.id)
    
    // [TODO]
  }
  
  func testCreateItem() {
    // TODO
  }
  
  func testSaveItem() {
    // TODO
  }
  
  func testDeleteItem() {
    // TODO
  }
  
  func testGetItemsSortedByName() {
    // TODO
  }
  
  func getItemById() {
    // TODO
  }
  
  func testGetAssignedDates() {
    // TODO
  }
}
