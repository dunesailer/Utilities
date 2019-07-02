import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Dunesailer_UtilitiesTests.allTests),
    ]
}
#endif
