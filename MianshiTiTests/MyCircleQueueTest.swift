//
//  MyCircleQueueTest.swift
//  MianshiTiTests
//
//  Created by yupeiliang on 2019/6/14.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

import XCTest

class MyCircleQueueTest: XCTestCase {
    var cq: MyCircularQueue!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        cq = MyCircularQueue(3)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        cq = nil
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testLogic() {
        var r = cq.enQueue(1)
        XCTAssertTrue(r)
        r = cq.enQueue(2)
        XCTAssertTrue(r)
        r = cq.enQueue(3)
        XCTAssertTrue(r)
        r = cq.enQueue(4)
        XCTAssertFalse(r)
        
        var iR = cq.Rear()
        XCTAssertEqual(iR, 3)
        r = cq.isFull()
        XCTAssertEqual(true, r)
        r = cq.deQueue()
        XCTAssertEqual(true, r)
        r = cq.enQueue(4)
        XCTAssertEqual(r, true)
        iR = cq.Rear()
        XCTAssertEqual(4, iR)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
