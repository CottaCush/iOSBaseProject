//  iOSBaseProjectTests.swift
//  iOSBaseProjectTests
//

import XCTest
import Foundation
@testable import iOSBaseProject
class StringPrimitiveTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
      // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

   func test_replacing_string() {
      let number = "080354647849"
      let replacedNumber = number.replacing(range: 2...6, with: "*")
      XCTAssertEqual(replacedNumber, "08*47849")
      XCTAssertNotEqual(replacedNumber, "080***47849")
      }

   func test_trim_string() {
      let actual = "trimmedString   "
      let expected = "trimmedString"
      XCTAssertEqual(actual.trim(), expected)
      XCTAssertNotEqual(actual.trim(), actual)
   }

   func test_intValue_string() {
      XCTAssertEqual("234".intValue, 234)
   }

   func test_doubleValue_string() {
      XCTAssertEqual("234.34".doubleValue, 234.34)
      XCTAssertNotEqual("234.34".doubleValue, 234)
   }

    func test_string_to_date() {
        let givenDate = "2018-01-12"
        XCTAssertEqual(givenDate.asDate, "12 January 2018")
        XCTAssertNotEqual(givenDate.asDate, "January 12 2018")
    }

    
}

class DoublePrimitiveTests: XCTestCase {
	override func setUp() {
		super.setUp()
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
		super.tearDown()
	}
	
	func testExample() {
		// This is an example of a functional test case.
		// Use XCTAssert and related functions to verify your tests produce the correct results.
	}
	
	func testPerformanceExample() {
		// This is an example of a performance test case.
		self.measure {
			// Put the code you want to measure the time of here.
		}
	}
	
	func test_double_short_currency_decription() {
        let givenMillion:Double = 1000000.00
        let givenThousand: Double = 900000.00
        let givenBillion: Double = 1000000000.00
        XCTAssertEqual(givenThousand.shortCurrencyDecription,"₦900K")
        XCTAssertEqual(givenMillion.shortCurrencyDecription,"₦1M")
        XCTAssertEqual(givenBillion.shortCurrencyDecription, "₦1B")
	}
}
