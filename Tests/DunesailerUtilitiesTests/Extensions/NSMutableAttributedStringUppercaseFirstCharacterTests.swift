//  Created by B.T. Franklin on 1/12/21.

#if !os(watchOS)

import XCTest
@testable import DunesailerUtilities

final class NSMutableAttributedStringUppercaseFirstCharacterTests: XCTestCase {

    func testEmptyString() {
        let emptyString = ""
        let mutableString = NSMutableAttributedString(string: emptyString)
        mutableString.uppercaseFirstCharacter()
        XCTAssertEqual(NSMutableAttributedString(string: emptyString), mutableString)
    }

    func testAlreadyUppercased() {
        let testString = "Already uppercased"
        let mutableString = NSMutableAttributedString(string: testString)
        mutableString.uppercaseFirstCharacter()
        XCTAssertEqual(NSMutableAttributedString(string: testString), mutableString)
    }

    func testNotUppercaseable() {
        let startsWithSpace = " starts with space"
        let mutableString1 = NSMutableAttributedString(string: startsWithSpace)
        mutableString1.uppercaseFirstCharacter()
        XCTAssertEqual(NSMutableAttributedString(string: startsWithSpace), mutableString1)

        let startsWithUnderscore = "_starts with underscore"
        let mutableString2 = NSMutableAttributedString(string: startsWithUnderscore)
        mutableString2.uppercaseFirstCharacter()
        XCTAssertEqual(NSMutableAttributedString(string: startsWithUnderscore), mutableString2)

        let startsWithPercent = "%starts with percent"
        let mutableString3 = NSMutableAttributedString(string: startsWithPercent)
        mutableString3.uppercaseFirstCharacter()
        XCTAssertEqual(NSMutableAttributedString(string: startsWithPercent), mutableString3)
    }

    func testLowercased() {
        let testString = "lowercased string"
        let mutableString = NSMutableAttributedString(string: testString)
        mutableString.uppercaseFirstCharacter()
        XCTAssertEqual(NSMutableAttributedString(string: "Lowercased string"), mutableString)
    }
}
#endif
