//
//  BSTTreeTest.swift
//  MianshiTiTests
//
//  Created by Qiqiuzhe on 2019/6/29.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

import XCTest

class BSTTreeTest: XCTestCase {
    var bst:BSTTree<Int, Int>!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        bst = BSTTree()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        bst = nil
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNotNil(bst)
    }
    
    func testLogic() -> Void {
        bst.add(key: 20, value: 200)
        bst.add(key: 10, value: 100)
        bst.add(key: 24, value: 240)
        bst.add(key: 13, value: 130)
        if bst.containes(key: 10) {
            print("10 exists")
        }
        let rValue = bst.remove(key:24)
        print("remove value = \(String(describing: rValue))")
        XCTAssertTrue(bst.containes(key: 20))
        XCTAssertTrue(bst.containes(key: 10))
        
        XCTAssertEqual(Optional(240), rValue)
        XCTAssertFalse(bst.containes(key: 24))
        XCTAssertEqual(4, bst.getSize())
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
