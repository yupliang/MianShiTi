//
//  FibProblemTests.swift
//  MianshiTiTests
//
//  Created by app-01 on 2019/8/13.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

import XCTest

class FibProblemTests: XCTestCase {

    var fib:FibProblem!
//    var <#name#> = <#value#>
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        fib = FibProblem()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        fib = nil
    }
    
    func testFib() -> Void {
        fib.type = .nonRecusive
        let n1 = fib.Fib(1)
        XCTAssertEqual(n1, 1)
        XCTAssertEqual(fib.Fib(2), 1)
        XCTAssertEqual(fib.Fib(3), 2)
        XCTAssertEqual(fib.Fib(4), 3)
        XCTAssertEqual(fib.Fib(5), 5)
        XCTAssertEqual(fib.Fib(6), 8)
        XCTAssertEqual(fib.Fib(7), 13)
        XCTAssertEqual(fib.Fib(8), 21)
        XCTAssertEqual(fib.Fib(9), 34)
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

}
