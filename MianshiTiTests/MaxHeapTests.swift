//
//  MaxHeapTests.swift
//  MianshiTiTests
//
//  Created by Qiqiuzhe on 2019/6/30.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

import XCTest

class MaxHeapTests: XCTestCase {
    var maxHeap:MaxHeap<Int>!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        maxHeap = MaxHeap()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        maxHeap = nil
    }
    
    func testLogic() -> Void {
        XCTAssertNil(maxHeap.popMax())
        XCTAssertNil(maxHeap.getMax())
        maxHeap.add(k: 10)
        maxHeap.add(k: 100)
        
        XCTAssertEqual(2, maxHeap.size())
        XCTAssertEqual(100, maxHeap.getMax())
        XCTAssertEqual(100, maxHeap.popMax())
        XCTAssertEqual(1, maxHeap.size())
        
        maxHeap.add(k: 50)
        XCTAssertEqual(2, maxHeap.size())
        XCTAssertEqual(50, maxHeap.popMax())
        maxHeap.popMax()
        maxHeap.popMax()
        XCTAssertTrue(maxHeap.isEmpty())
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
