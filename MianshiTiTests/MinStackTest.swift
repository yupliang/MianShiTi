//
//  MinStackTest.swift
//  MianshiTiTests
//
//  Created by Qiqiuzhe on 2019/6/13.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

import XCTest

class MinStackTest: XCTestCase {
    var minStack: MinStack!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        minStack = MinStack()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        minStack = nil
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testLogic() {
//        minStack.push(-2);
//        minStack.push(0);
//        minStack.push(-3);
//        minStack.getMin();  // --> Returns -3.
//        minStack.pop();
//        minStack.top();      //--> Returns 0.
        var r = minStack.getMin();   //--> Returns -2.
//        XCTAssertTrue(r == -2)
        
        minStack.push(2)
        minStack.push(0)
        minStack.push(3)
        minStack.push(0)
        r = minStack.getMin()
        minStack.pop()
        r = minStack.getMin()
        XCTAssertTrue(0 == r, "is \(r)")
        minStack.pop()
        r = minStack.getMin()
        XCTAssertTrue(0 == r)
        minStack.pop()
        r = minStack.getMin()
        XCTAssertTrue(2 == r)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
