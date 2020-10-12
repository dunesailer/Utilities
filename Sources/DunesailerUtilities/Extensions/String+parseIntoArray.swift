//  Created by B.T. Franklin on 7/11/18

extension String {
    public func parseIntoArrayByLine() -> [String] {
        var contents = self
        contents = contents.replacingOccurrences(of: "\r", with: "\n")
        contents = contents.replacingOccurrences(of: "\n\n", with: "\n")
        
        var contentsArray = contents.components(separatedBy: "\n")
        if contentsArray.last!.isEmpty {
            contentsArray.removeLast()
        }
        
        return contentsArray
    }
}

