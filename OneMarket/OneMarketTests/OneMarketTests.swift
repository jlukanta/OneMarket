//
//  OneMarketTests.swift
//  OneMarketTests
//
//  Created by James Lukanta on 1/18/17.
//  Copyright © 2017 Flying Jar Inc. All rights reserved.
//

import XCTest
@testable import OneMarket

class JsonItemServiceTests: XCTestCase {
  let service = JsonItemService()
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testAddItem() {
    let service = JsonItemService()
    
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
  
  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
  
}
