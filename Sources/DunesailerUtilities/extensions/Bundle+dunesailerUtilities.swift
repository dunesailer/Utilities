//  Created by B.T. Franklin

import Foundation

extension Bundle {
    
    #if os(iOS)
    static let dunesailerUtilities = Bundle(identifier: "science.dunesailer.Utilities-iOS")!
    #elseif os(macOS)
    static let dunesailerUtilities = Bundle(identifier: "science.dunesailer.Utilities")!
    #endif
}
