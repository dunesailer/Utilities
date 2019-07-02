public class WeightedProbabilityPile<Item: Hashable & Codable>: Codable {
    
    // MARK: Properties
    private var itemWeights: [Item:Int] = [:]
    
    // MARK: Computed Properties
    private var weightSum: Int {
        var weightSum = 0
        for weight in itemWeights.values {
            weightSum += weight
        }
        return weightSum
    }
    
    // MARK: Methods
    public func add(_ item: Item, withWeight weight: Int) {
        itemWeights[item] = weight
    }
    
    public func remove(_ item: Item) {
        itemWeights.removeValue(forKey: item)
    }
    
    public func selectItem() -> Item? {
        if itemWeights.isEmpty {
            return nil
        }
        
        var items: [Item] = []
        var itemPositions: [Int] = []
        
        var currentPosition = 0;
        for itemWeight in itemWeights {
            items.append(itemWeight.key)
            itemPositions.append(currentPosition)
            
            currentPosition += itemWeight.value
        }
        
        let randomNumber = Int.random(in: 0...weightSum)
        
        for i in 1..<itemPositions.count {
            if randomNumber < itemPositions[i] {
                return items[i-1]
            }
        }
        
        return items.last!
    }
}
