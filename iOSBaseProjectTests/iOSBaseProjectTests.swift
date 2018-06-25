//
//  iOSBaseProjectTests.swift
//  iOSBaseProjectTests
//
//  Created by Jubril  EDU on 5/29/18.
//  Copyright © 2018 Cotta & Cush. All rights reserved.
//

import XCTest
import Foundation
@testable import iOSBaseProject
class iOSBaseProjectTests: XCTestCase {
    
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
        debugPrint("Date Item")
        debugPrint(givenDate.asDate)
    }

    
}
