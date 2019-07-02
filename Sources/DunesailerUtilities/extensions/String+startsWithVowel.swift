//  Created by B.T. Franklin on 7/11/18

extension String {
    public var startsWithVowel: Bool {
        switch self.lowercased()[self.startIndex] {
        case "a", "e", "i", "o", "u":
            return true
        default:
            return false
        }
    }
}
