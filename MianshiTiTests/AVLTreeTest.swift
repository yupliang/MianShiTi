//
//  AVLTreeTest.swift
//  MianshiTiTests
//
//  Created by yupeiliang on 2019/7/4.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

import XCTest

class AVLTreeTest: XCTestCase {

    var tree:AVLTree<Int,Int>!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        tree = AVLTree<Int,Int>()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        tree = nil
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNotNil(tree)
    }

    func testLogic() -> Void {
        tree.add(key:20, value:20)
        tree.add(key: 10, value: 100)
        tree.add(key: 9, value: 90)
        tree.add(key: 8, value: 80)
        tree.add(key: 7, value: 70)
        tree.add(key: 6, value: 60)
        
        var node = tree.get(key: 20)
        XCTAssertEqual(1, node?.height)
        node = tree.get(key: 10)
        XCTAssertEqual(2, node?.height)
        node = tree.get(key: 9)
        XCTAssertEqual(1, node?.height)
        node = tree.get(key: 8)
        XCTAssertEqual(3, node?.height)
        node = tree.get(key: 7)
        XCTAssertEqual(2, node?.height)
        node = tree.get(key: 6)
        XCTAssertEqual(1, node?.height)
        
        XCTAssertTrue(tree.isBalance())
        XCTAssertEqual(6, tree.getSize())
        XCTAssertTrue(tree.isBST())
        var arr = Array<Int>()
        tree.inOrder(result: &arr, root: tree.root)
        XCTAssertEqual([6,7,8,9,10,20], arr)
        XCTAssertEqual(3, tree.root?.height)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
