//  Created by B.T. Franklin on 1/11/21.

#if !os(watchOS)

import XCTest
@testable import DunesailerUtilities

final class StringFirstUppercasedTests: XCTestCase {

    func testEmptyString() {
        let emptyString = ""
        XCTAssertEqual(emptyString, emptyString.firstUppercased)
    }

    func testAlreadyUppercased() {
        let testString = "Already uppercased"
        XCTAssertEqual(testString, testString.firstUppercased)
    }

    func testNotUppercaseable() {
        let startsWithSpace = " starts with space"
        XCTAssertEqual(startsWithSpace, startsWithSpace.firstUppercased)

        let startsWithUnderscore = "_starts with underscore"
        XCTAssertEqual(startsWithUnderscore, startsWithUnderscore.firstUppercased)

        let startsWithPercent = "%starts with percent"
        XCTAssertEqual(startsWithPercent, startsWithPercent.firstUppercased)
    }

    func testLowercased() {
        let testString = "lowercased string"
        XCTAssertEqual("Lowercased string", testString.firstUppercased)
    }

}
#endif
