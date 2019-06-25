//
//  BinaryTreeTest.swift
//  MianshiTiTests
//
//  Created by Qiqiuzhe on 2019/6/24.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

import XCTest

class BinaryTreeTest: XCTestCase {

    var btree:BinaryTree!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        btree = BinaryTree()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        btree = nil
    }
    
    func testLogic() -> Void {
        let arr:NSMutableArray = NSMutableArray(array: [ 1, 2, 3, 11, 13, 12, 9 , 8, 10, 15, 14, 7 ])
        btree.createHeap(arr)
        var r = BinaryTree.level(btree)
        print("arr is \(arr)")
        XCTAssertEqual(r, "15->14-12-11->13->7->9->8->10->1->2->3")
    }
    
    func testArrayExchange() -> Void {
        let arr:NSMutableArray = NSMutableArray(array: [ 1, 2, 3, 11, 13, 12, 9 , 8, 10, 15, 14, 7 ])
        arr.replaceObject(at: 0, with: 100)
        XCTAssertEqual(100, arr[0] as! Int)
        XCTAssertEqual(2, arr[1] as! Int)
    }
    
    func testNumberCompare() -> Void {
        let a:NSNumber = NSNumber(integerLiteral: 10)
        let b:NSNumber = NSNumber(integerLiteral: 9)
//        XCTAssertTrue(a > b, "a is \(a) b is \(b)")
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNotNil(btree)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
