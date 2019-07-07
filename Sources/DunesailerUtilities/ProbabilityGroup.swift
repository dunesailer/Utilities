public struct ProbabilityGroup<Item: Hashable & Codable>: Hashable {
    
    enum CodingKeys: String, CodingKey {
        case probabilitiesByItem = "probabilities"
    }
    
    // MARK: Constants
    public let probabilitiesByItem: [Item: Int]
    private let items: [Item]
    private let itemPositions: [Int]
    private let total: Int
    
    // MARK: Initializers
    public init(_ probabilitiesByItem: [Item: Int], enforcePercent: Bool = true) {
        precondition(!probabilitiesByItem.isEmpty, "Must provide at least one item.")
        
        self.probabilitiesByItem = probabilitiesByItem
        
        var currentPosition = 0;
        var items: [Item] = []
        var itemPositions: [Int] = []
        
        for itemProbability in probabilitiesByItem {
            items.append(itemProbability.key)
            itemPositions.append(currentPosition)
            
            currentPosition += itemProbability.value
        }
        
        if enforcePercent {
            assert(currentPosition == 100, "Item probabilities must add up to exactly 100, but provided ones add up to \(currentPosition).")
        }
        
        self.items = items
        self.itemPositions = itemPositions
        self.total = currentPosition
    }
    
    public init(copying probabilityGroup: ProbabilityGroup, without item: Item) {
        precondition(probabilityGroup.items.contains(item), "Probability group does not contain \(item)")
        
        var probabilitiesByItem = probabilityGroup.probabilitiesByItem
        probabilitiesByItem[item] = nil
        self.init(probabilitiesByItem, enforcePercent: false)
    }
    
    // MARK: Non-mutating Methods
    public func selectItem() -> Item {
        
        let randomNumber = Int.random(in: 0...total)
        
        for i in 1..<itemPositions.count {
            if randomNumber < itemPositions[i] {
                return items[i-1]
            }
        }
        
        return items.last!
    }
}

extension ProbabilityGroup: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(probabilitiesByItem, forKey: .probabilitiesByItem)
    }
}

extension ProbabilityGroup: Decodable {
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let probabilitiesByItem = try values.decode([Item: Int].self, forKey: .probabilitiesByItem)
        self.init(probabilitiesByItem, enforcePercent: false)
    }
}