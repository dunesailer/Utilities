//  Created by B.T. Franklin on 1/4/19

import XCTest
@testable import DunesailerUtilities

class DoubleGaussianTests: XCTestCase {

    func testRandomGaussian() {
        
        var minValue: Double = 100, maxValue: Double = -100
        var total: Double = 0
        for _ in 0...1000 {
            let randomGaussian = Double.randomGaussian()
            
            if randomGaussian < minValue {
                minValue = randomGaussian
            }
            if randomGaussian > maxValue {
                maxValue = randomGaussian
            }
            
            total += randomGaussian
        }
        
        let resultingAverage = total / 1000
        
        print("avg: \(resultingAverage)")
        print("max: \(maxValue)")
        print("min: \(minValue)")
        
        
        XCTAssertLessThanOrEqual(-2, resultingAverage)
        XCTAssertGreaterThanOrEqual(2, resultingAverage)
        
        XCTAssertLessThanOrEqual(-10, minValue)
        XCTAssertGreaterThanOrEqual(0, minValue)
        
        XCTAssertLessThanOrEqual(0, maxValue)
        XCTAssertGreaterThanOrEqual(10, maxValue)
    }
    
    func testRandomGaussianWithParams() {
        let standardDeviation: Double = 100
        let mean: Double = 500
        
        var minValue: Double = mean*100, maxValue: Double = -mean*100
        var total: Double = 0
        for _ in 0...1000 {
            let randomGaussian = Double.randomGaussian(withStandardDeviation: standardDeviation, withMean: mean)
            
            if randomGaussian < minValue {
                minValue = randomGaussian
            }
            if randomGaussian > maxValue {
                maxValue = randomGaussian
            }
            
            total += randomGaussian
        }
        
        let resultingAverage = total / 1000
        
        print("avg: \(resultingAverage)")
        print("max: \(maxValue)")
        print("min: \(minValue)")
        

        XCTAssertLessThanOrEqual(mean-20, resultingAverage)
        XCTAssertGreaterThanOrEqual(mean+20, resultingAverage)
        
        XCTAssertLessThanOrEqual(0, minValue)
        XCTAssertGreaterThanOrEqual(mean, minValue)
        
        XCTAssertLessThanOrEqual(mean, maxValue)
        XCTAssertGreaterThanOrEqual(1000, maxValue)
    }
    
    func testPerformanceRandomGaussian() {
        self.measure {
            for _ in 0...1000 {
                _ = Double.randomGaussian()
            }
        }
        
    }
}
