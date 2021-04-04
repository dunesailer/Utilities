//  Created by B.T. Franklin on an unknown date prior to 2020

import Foundation

public class DULRUCache<ValueType: AnyObject> {
    
    public let capacity: Int
    private var valuesByID: [ObjectIdentifier: ValueType]
    private var valueIDs: [ObjectIdentifier]
    
    public var count: Int {
        return valueIDs.count
    }
    
    public init(capacity: Int) {
        guard capacity > 0 else {
            fatalError("LRUCache must have a capacity greater than 0. Requested capacity: \(capacity)")
        }
        self.capacity = capacity
        
        valuesByID = [:]
        valueIDs = []
    }
    
    public func store(value: ValueType) {
        
        let valueID = ObjectIdentifier(value)
        
        // Search for the ID's index among the already-stored values
        for (index,_) in valueIDs.enumerated() {
            if valueIDs[index] == valueID {
                valueIDs.remove(at: index)
                break
            }
        }
        
        // Add the new ID at the top of the list
        valueIDs.insert(valueID, at: 0)
        
        // Store the associated object
        valuesByID[valueID] = value
        
        // If the cache has grown too large, remove the oldest item
        if valueIDs.count > capacity {
            let oldestID = valueIDs.removeLast()
            valuesByID.removeValue(forKey: oldestID)
        }
    }
    
    public func retrieve(at index: Int) -> ValueType {
        guard (0..<count).contains(index) else {
            fatalError("Index \(index) out of range. Allowed values are 0 - \(count-1).")
        }
        return valuesByID[valueIDs[index]]!
    }
    
    public func removeAll() {
        valueIDs.removeAll()
        valuesByID.removeAll()
    }
}
