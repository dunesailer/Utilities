import Foundation

public class LRUCache<ValueType: AnyObject> {
    
    public let capacity: Int
    private var valuesByID: [ObjectIdentifier: ValueType]
    private var valueIDs: [ObjectIdentifier]
    
    public var count: Int {
        return valueIDs.count
    }
    
    public init(capacity: Int) {
        precondition(capacity > 0, "Capacity must be a positive number. Provided value: \(capacity)")
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
        precondition((0..<count).contains(index), "Index \(index) out of range. Allowed values are 0 - \(count-1).")
        return valuesByID[valueIDs[index]]!
    }
    
    public func removeAll() {
        valueIDs.removeAll()
        valuesByID.removeAll()
    }
}
