//  Created by B.T. Franklin on 2/11/18.

import Foundation

extension NSMutableAttributedString {
    public func uppercaseFirstCharacter() {
        guard let first = self.string.first else { return }
        
        let newFirstCharacter = String(first).uppercased()
        self.replaceCharacters(in: NSRange(location: 0, length: 1),
                               with: newFirstCharacter)
    }
}
