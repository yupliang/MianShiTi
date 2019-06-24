//
//  MyCircleDequeTest.swift
//  MianshiTiTests
//
//  Created by yupeiliang on 2019/6/14.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

import XCTest

class MyCircleDequeTest: XCTestCase {
    
    var cdq: MyCircularDeque!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        cdq = MyCircularDeque(3)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        cdq = nil
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testLogic() {
        var r = cdq.insertLast(1)
        XCTAssertEqual(r, true)
        r = cdq.insertLast(2)
        XCTAssertEqual(r, true)
        r = cdq.insertFront(3)
        XCTAssertEqual(r, true)
        r = cdq.insertFront(4)
        XCTAssertNotEqual(true, r)
        var iR = cdq.getRear()
        XCTAssertEqual(2, iR)
        r = cdq.isFull()
        XCTAssertEqual(true, r)
        r = cdq.deleteLast()
        XCTAssertEqual(true, r)
        r = cdq.insertFront(4)
        XCTAssertEqual(r, true)
        iR = cdq.getFront()
        XCTAssertEqual(4, iR)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
