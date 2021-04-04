//  Created by B.T. Franklin on 11/9/16.

import XCTest
@testable import DunesailerUtilities

final class DULRUCacheTests: XCTestCase {
    
    class UniqueTestable {
        
        let uuid = UUID()
        let value: Int
        
        init(value: Int) {
            self.value = value
        }
    }
    
    func testStoreAndRetrieveLowCapacity() {
        let cache = DULRUCache<UniqueTestable>(capacity: 5)
        XCTAssertEqual(5, cache.capacity)
        XCTAssertEqual(0, cache.count)
        
        var uniqueTestables: [UniqueTestable] = []
        for value in 1...10 {
            uniqueTestables.append(UniqueTestable(value: value))
        }

        for uniqueTestable in uniqueTestables {
            cache.store(value: uniqueTestable)
        }
        
        // Cache should be full
        XCTAssertEqual(cache.capacity, cache.count)
        
        // Most recent two items should be last two testables
        XCTAssertEqual(uniqueTestables[9].uuid, cache.retrieve(at: 0).uuid)
        XCTAssertEqual(uniqueTestables[8].uuid, cache.retrieve(at: 1).uuid)
        
        // Replace most recent item
        cache.store(value: uniqueTestables[3])
        
        XCTAssertEqual(uniqueTestables[3].uuid, cache.retrieve(at: 0).uuid)
        XCTAssertEqual(uniqueTestables[9].uuid, cache.retrieve(at: 1).uuid)
        XCTAssertEqual(uniqueTestables[8].uuid, cache.retrieve(at: 2).uuid)

        // Reposition an existing recent item
        cache.store(value: uniqueTestables[9])
        
        XCTAssertEqual(uniqueTestables[9].uuid, cache.retrieve(at: 0).uuid)
        XCTAssertEqual(uniqueTestables[3].uuid, cache.retrieve(at: 1).uuid)
        XCTAssertEqual(uniqueTestables[8].uuid, cache.retrieve(at: 2).uuid)
        
        // Clear the cache
        cache.removeAll()
        XCTAssertEqual(0, cache.count)
    }
    
    func testStoreAndRetrieveHighCapacity() {
        let cache = DULRUCache<UniqueTestable>(capacity: 500)
        XCTAssertEqual(500, cache.capacity)
        XCTAssertEqual(0, cache.count)
        
        var uniqueTestables: [UniqueTestable] = []
        for value in 1...1000 {
            uniqueTestables.append(UniqueTestable(value: value))
        }
        
        for uniqueTestable in uniqueTestables {
            cache.store(value: uniqueTestable)
        }
        
        // Cache should be full
        XCTAssertEqual(cache.capacity, cache.count)
        
        // Most recent two items should be last two testables
        XCTAssertEqual(uniqueTestables[999].uuid, cache.retrieve(at: 0).uuid)
        XCTAssertEqual(uniqueTestables[998].uuid, cache.retrieve(at: 1).uuid)
        
        // Replace most recent item
        cache.store(value: uniqueTestables[300])
        
        XCTAssertEqual(uniqueTestables[300].uuid, cache.retrieve(at: 0).uuid)
        XCTAssertEqual(uniqueTestables[999].uuid, cache.retrieve(at: 1).uuid)
        XCTAssertEqual(uniqueTestables[998].uuid, cache.retrieve(at: 2).uuid)
        
        // Reposition an existing recent item
        cache.store(value: uniqueTestables[999])
        
        XCTAssertEqual(uniqueTestables[999].uuid, cache.retrieve(at: 0).uuid)
        XCTAssertEqual(uniqueTestables[300].uuid, cache.retrieve(at: 1).uuid)
        XCTAssertEqual(uniqueTestables[998].uuid, cache.retrieve(at: 2).uuid)
        
        // Clear the cache
        cache.removeAll()
        XCTAssertEqual(0, cache.count)
    }
    
    func testPerformance() {
        
        let cache = DULRUCache<UniqueTestable>(capacity: 16)
        
        var uniqueTestables: [UniqueTestable] = []
        for value in 1...32 {
            uniqueTestables.append(UniqueTestable(value: value))
        }
        
        self.measure {
            for _ in 0...1000 {
                let uniqueTestable = uniqueTestables.randomElement()!
                cache.store(value: uniqueTestable)
                _ = cache.retrieve(at: Int.random(in: 0..<cache.count))
            }
        }
    }
    
}
