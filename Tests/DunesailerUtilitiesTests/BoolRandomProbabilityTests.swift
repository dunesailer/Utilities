//  Created by B.T. Franklin on 1/4/19

import XCTest
@testable import DunesailerUtilities

class BoolRandomProbabilityTests: XCTestCase {

    func testRandomProbability() {
        
        // 0%
        for _ in 1...1000 {
            let randomBoolean = Bool.random(probability: 0)
            XCTAssertFalse(randomBoolean)
        }
        
        // 20%
        var trueCount = 0
        for _ in 1...1000 {
            let randomBoolean = Bool.random(probability: 20)
            if randomBoolean {
                trueCount += 1
            }
        }
        XCTAssertTrue((175...225).contains(trueCount), "trueCount was \(trueCount)")
        
        // 50%
        trueCount = 0
        for _ in 1...1000 {
            let randomBoolean = Bool.random(probability: 50)
            if randomBoolean {
                trueCount += 1
            }
        }
        XCTAssertTrue((475...525).contains(trueCount), "trueCount was \(trueCount)")

        // 75%
        trueCount = 0
        for _ in 1...1000 {
            let randomBoolean = Bool.random(probability: 75)
            if randomBoolean {
                trueCount += 1
            }
        }
        XCTAssertTrue((725...775).contains(trueCount), "trueCount was \(trueCount)")
        
        // 100%
        for _ in 1...1000 {
            let randomBoolean = Bool.random(probability: 100)
            XCTAssertTrue(randomBoolean)
        }
    }
    
    func testPerformanceRandomProbability() {
        self.measure {
            for _ in 0...1000 {
                _ = Bool.random(probability: 50)
            }
        }
    }

}
