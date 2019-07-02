//  Created by B.T. Franklin on 11/9/16.

import XCTest
@testable import DunesailerUtilities

class WeightedProbabilityPileTests: XCTestCase {
    
    func testSelectItem() {
        
        let testPile = WeightedProbabilityPile<String>()
        XCTAssertNil(testPile.selectItem())
        
        let itemNames = [
            "One",
            "Two",
            "Three",
            "Four",
            "Five"
        ]
        for itemName in itemNames {
            testPile.add(itemName, withWeight: 37)
        }
        
        for _ in 1...1000 {
            let testResultItem = testPile.selectItem()!
            XCTAssertNotNil(testResultItem)
            XCTAssert(itemNames.contains(testResultItem))
        }
    }
    
    func testRemove() {
        
        let testPile = WeightedProbabilityPile<String>()
        
        var itemNames = [
            "One",
            "Two",
            "Three",
            "Four",
            "Five"
        ]
        for itemName in itemNames {
            testPile.add(itemName, withWeight: 37)
        }

        testPile.remove(itemNames.remove(at: 0))
        testPile.remove(itemNames.remove(at: itemNames.count-1))
        
        for _ in 1...1000 {
            let testResultItem = testPile.selectItem()!
            XCTAssertNotNil(testResultItem)
            XCTAssert(itemNames.contains(testResultItem))
        }
    }
    
    func testCodable() {
        let testPile = WeightedProbabilityPile<String>()
        
        let itemNames = [
            "One",
            "Two",
            "Three",
            "Four",
            "Five"
        ]
        for itemName in itemNames {
            testPile.add(itemName, withWeight: 37)
        }

        let encoder = JSONEncoder()
        let encoded = try! encoder.encode(testPile)
        
        let decoder = JSONDecoder()
        let decodedPile = try! decoder.decode(WeightedProbabilityPile<String>.self, from: encoded)
        
        let testResultItem = decodedPile.selectItem()!
        XCTAssertNotNil(testResultItem)
        XCTAssert(itemNames.contains(testResultItem))
    }

    func testPerformance() {
        
        let testPile = WeightedProbabilityPile<String>()
        testPile.add("One", withWeight: 20)
        testPile.add("Two", withWeight: 20)
        testPile.add("Three", withWeight: 20)
        testPile.add("Four", withWeight: 20)
        testPile.add("Five", withWeight: 20)
        
        self.measure {
            for _ in 1...1000 {
                _ = testPile.selectItem()
            }
        }
    }
    
}
