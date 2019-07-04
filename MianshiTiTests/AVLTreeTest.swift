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
        XCTAssertTrue(tree.isBST())
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
