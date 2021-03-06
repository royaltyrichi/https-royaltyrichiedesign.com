//
//  UnicodeOutputStreamTests.swift
//  extensions-kit-tests
//
//  Created by Astemir Eleev on 29/01/2019.
//  Copyright ยฉ 2019 Astemir Eleev. All rights reserved.
//

import XCTest
@testable import ExtendedFoundation

class UnicodeOutputStreamTests: XCTestCase {

    static var allTests = [
        ("test", test)
    ]
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test() {
        let tastables = ["0: ๐จ U+1F468\tMAN", "1: โ U+200D\tZERO WIDTH JOINER", "2: ๐ฉ U+1F469\tWOMAN", "3: โ U+200D\tZERO WIDTH JOINER", "4: ๐ง U+1F467\tGIRL", "5: โ U+200D\tZERO WIDTH JOINER", "6: ๐ง U+1F467\tGIRL"]
        
        var unicodeOutputStream = UnicodeOutputStream()
        unicodeOutputStream.outputCompletion = {
            equalsAtLeastOne(from: tastables, target: $0)
        }
        print("๐จโ๐ฉโ๐งโ๐ง", to: &unicodeOutputStream)
        
        func equalsAtLeastOne<T: Equatable>(from collection: [T], target: T) {
            for item in collection where item == target {
                XCTAssert(true)
                return
            }
            XCTAssert(false)
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
