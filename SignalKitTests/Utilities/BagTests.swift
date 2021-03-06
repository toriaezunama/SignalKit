//
//  BagTests.swift
//  SignalKit
//
//  Created by Yanko Dimitrov on 8/12/15.
//  Copyright © 2015 Yanko Dimitrov. All rights reserved.
//

import XCTest
@testable import SignalKit

class BagTests: XCTestCase {
    
    class FakeGenerator: TokenGeneratorType {
        func nextToken() -> Token {
            return "1"
        }
    }
    
    func testBagIsInitiallyEmpty() {
        
        let bag = Bag<Int>()
        
        XCTAssertEqual(bag.count, 0, "Initially the bag should be empty")
    }
    
    func testInsertItem() {
        
        var bag = Bag<String>(keyGenerator: FakeGenerator())
        
        let token = bag.insert("John")
        
        XCTAssertEqual(token, "1", "Should be able to insert a new item in the bag")
        XCTAssertEqual(bag.count, 1, "Should contain one item")
    }
    
    func testInsertDuplicateItems() {
        
        var bag = Bag<Int>()
        
        bag.insert(1)
        bag.insert(1)
        bag.insert(1)
        
        XCTAssertEqual(bag.count, 3, "Should be able to insert non unique items")
    }
    
    func testRemoveItem() {
        
        var bag = Bag<Int>()
        
        let token = bag.insert(1)
        
        bag.removeItemWithToken(token)
        
        XCTAssertEqual(bag.count, 0, "Should be able to remove an item from the bag")
    }
    
    func testRemoveAllItems() {
        
        var bag = Bag<Int>()
        
        bag.insert(1)
        bag.insert(2)
        bag.insert(3)
        
        bag.removeItems()
        
        XCTAssertEqual(bag.count, 0, "Should remove all bag items")
    }
    
    func testIterateOverItems() {
        
        var bag = Bag<Int>()
        var sum = 0
        
        bag.insert(1)
        bag.insert(2)
        bag.insert(3)
        
        for (_, item) in bag {
            sum += item
        }
        
        XCTAssertEqual(sum, 6, "Should be able to iterate over the bag collection")
    }
}
