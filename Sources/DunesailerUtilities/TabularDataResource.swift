import Foundation

public class TabularDataResource {
    
    // MARK: Constants
    public let name: String
    public let directory: String
    public let bundle: Bundle
    
    // MARK: Properties
    public var data: [[String:String]] = []
    public var columnNames: [String] = []
    
    // MARK: Initializers
    public init(name: String, directory: String = "Data", usingBundle bundle: Bundle = Bundle.main) {
        self.name = name
        self.directory = directory
        self.bundle = bundle
    }
    
    // MARK: Public Methods
    
    public func save() -> Bool {
        
        // Convert data to string representation
        var fileContents = columnNames.map({
            return $0
        }).joined(separator: ",")

        fileContents += "\n"
        
        fileContents += data.map({ (row) -> String in
            var rowDataItems: [String] = []
            for columnName in columnNames {
                rowDataItems.append(row[columnName] ?? "")
            }
            return rowDataItems.joined(separator: ",")
        }).joined(separator: "\n")
        
        // Get the file path for the file in the bundle, creating it if necessary
        var fileName = name + ".csv"
        if let filePath = bundle.path(forResource: fileName, ofType: "csv") {
            fileName = filePath
        } else {
            fileName = bundle.bundlePath + fileName
        }
        
        // Write the file and return true if it works, false otherwise
        do {
            try fileContents.write(toFile: fileName, atomically: true, encoding: String.Encoding.utf8)
            return true
        } catch{
            return false
        }
    }
    
    public func load() {
        guard let filePath = bundle.path(forResource: name, ofType: "csv", inDirectory: directory) else {
            print("Unable to resolve file path for \(name) in \(directory)")
            return
        }
        
        // Retrieve the file contents in String form
        let fileContents: String
        do {
            fileContents = try String(contentsOfFile: filePath)
        } catch {
            print("File Read Error for file \(filePath)")
            return
        }
        
        // Clean up the file contents
        var rows = cleanRows(fileContents).components(separatedBy: "\n")
        if rows.last!.isEmpty {
            rows.removeLast()
        }
        
        // Convert the file contents into structured data
        if rows.count > 0 {
            columnNames = getStringFieldsForRow(rows.first!, delimiter:",")
            rows.removeFirst()
            
            data = []
            for row in rows {
                let fields = getStringFieldsForRow(row, delimiter: ",")
                if fields.count != columnNames.count {
                    print("Found row with wrong number of data fields. Skipping.")
                    continue
                }
                var dataRow = [String:String]()
                for (index,field) in fields.enumerated() {
                    let fieldName = columnNames[index]
                    dataRow[fieldName] = field
                }
                data += [dataRow]
            }
        } else {
            print("No data in file contents")
        }
    }
    
    // MARK: Private Methods
    
    private func cleanRows(_ fileContents: String) -> String {
        var cleanFileContents = fileContents
        cleanFileContents = cleanFileContents.replacingOccurrences(of: "\r", with: "\n")
        cleanFileContents = cleanFileContents.replacingOccurrences(of: "\n\n", with: "\n")
        return cleanFileContents
    }
    
    private func getStringFieldsForRow(_ row: String, delimiter: String) -> [String] {
        
        var quoteCleanedRow = row
        while let match = quoteCleanedRow.range(of: "\".*,.*\"", options: .regularExpression) {
            quoteCleanedRow = quoteCleanedRow.replacingOccurrences(of: ",", with: "\u{3000}", options: .caseInsensitive, range: match)
        }
        quoteCleanedRow = quoteCleanedRow.replacingOccurrences(of: "\"", with: "")
        
        var delimiterSplitFields = quoteCleanedRow.components(separatedBy: delimiter)
        for index in 0..<delimiterSplitFields.count {
            delimiterSplitFields[index] = delimiterSplitFields[index].replacingOccurrences(of: "\u{3000}", with: ",")
        }
        
        return delimiterSplitFields
    }
    
}

