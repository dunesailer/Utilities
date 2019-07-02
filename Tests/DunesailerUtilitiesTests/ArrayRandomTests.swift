//  Created by B.T. Franklin on 1/4/19

import XCTest
@testable import DunesailerUtilities

class ArrayRandomTests: XCTestCase {

    func testRandomElement() {
        var elementCounts = [
            "cat":0,
            "dog":0,
            "cow":0,
            "bat":0,
            "frog":0
        ]
        let elements = Array(elementCounts.keys)
        
        for _ in 0...1000 {
            let randomElement = elements.randomElement()!
            XCTAssert(elements.contains(randomElement))
            elementCounts[randomElement]! += 1
        }
        
        for element in elements {
            XCTAssertGreaterThan(elementCounts[element]!, 0, "Did not find \(element)")
        }
    }

    func testPerformanceRandomElement() {
        let elements = ["cat", "dog", "cow", "cat", "frog"]
        
        self.measure {
            for _ in 0...1000 {
                let randomElement = elements.randomElement()!
                XCTAssert(elements.contains(randomElement))
            }
        }
    }

}
