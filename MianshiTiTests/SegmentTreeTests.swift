//
//  SegmentTreeTests.swift
//  MianshiTiTests
//
//  Created by app-01 on 2019/7/25.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

import XCTest

class SegmentTreeTests: XCTestCase {
    
    var sumSeg:SegmentTree<Int>!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let datas = [8,10,20,7,40,32,12,3,19,26]
        sumSeg = SegmentTree<Int>(datas:datas, defaultValue:0, merger:{$0+$1})
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSumSegTree () {
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
