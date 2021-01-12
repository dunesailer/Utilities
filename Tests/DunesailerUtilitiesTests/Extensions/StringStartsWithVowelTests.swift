//  Created by B.T. Franklin on 1/12/21.

import XCTest
@testable import DunesailerUtilities

final class StringStartsWithVowelTests: XCTestCase {

    func testEmptyString() {
        let emptyString = ""
        XCTAssertEqual(false, emptyString.startsWithVowel)
    }

    func testUppercased() {
        let aString = "Apple"
        XCTAssertEqual(true, aString.startsWithVowel)

        let eString = "Elephant"
        XCTAssertEqual(true, eString.startsWithVowel)

        let iString = "Iguana"
        XCTAssertEqual(true, iString.startsWithVowel)

        let oString = "Orange"
        XCTAssertEqual(true, oString.startsWithVowel)

        let uString = "Uniform"
        XCTAssertEqual(true, uString.startsWithVowel)

        let yString = "Yogurt"
        XCTAssertEqual(false, yString.startsWithVowel)

        let qString = "Quiet"
        XCTAssertEqual(false, qString.startsWithVowel)

        let xString = "Xylophone"
        XCTAssertEqual(false, xString.startsWithVowel)
    }

    func testLowercased() {
        let aString = "apple"
        XCTAssertEqual(true, aString.startsWithVowel)

        let eString = "elephant"
        XCTAssertEqual(true, eString.startsWithVowel)

        let iString = "iguana"
        XCTAssertEqual(true, iString.startsWithVowel)

        let oString = "orange"
        XCTAssertEqual(true, oString.startsWithVowel)

        let uString = "uniform"
        XCTAssertEqual(true, uString.startsWithVowel)

        let yString = "yogurt"
        XCTAssertEqual(false, yString.startsWithVowel)

        let qString = "quiet"
        XCTAssertEqual(false, qString.startsWithVowel)

        let xString = "xylophone"
        XCTAssertEqual(false, xString.startsWithVowel)
    }

    func testNonCharacters() {
        let numString = "736"
        XCTAssertEqual(false, numString.startsWithVowel)

        let underscoreString = "_underscored_"
        XCTAssertEqual(false, underscoreString.startsWithVowel)

        let spaceString = " spaced"
        XCTAssertEqual(false, spaceString.startsWithVowel)
    }
}
