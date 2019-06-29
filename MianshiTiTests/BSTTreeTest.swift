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
    
    func testRemove() -> Void {
        bst.add(key: 20, value: 200)
        bst.add(key: 10, value: 100)
        bst.add(key: 24, value: 240)
        bst.add(key: 8, value: 80)
        bst.add(key: 13, value: 130)
        bst.add(key: 30, value: 300)
        bst.add(key: 12, value: 120)
        var r = bst.levelTree(node: bst.root)
        XCTAssertEqual("20->10->24->8->13->30->12", r)
        bst.remove(key: 10)
        XCTAssertFalse(bst.containes(key: 10))
        r = bst.levelTree(node: bst.root)
        XCTAssertEqual("20->12->24->8->13->30", r)
    }
    
    func testLogic() -> Void {
        let a = BSTNode(key: 10, value: 11)
        print("xx -- \(a.key!)")
        bst.add(key: 20, value: 200)
        bst.add(key: 10, value: 100)
        bst.add(key: 24, value: 240)
        bst.add(key: 13, value: 130)
        let s = bst.levelTree(node: bst.root)!
        print(s)
        XCTAssertEqual("20->10->24->13", s)
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
