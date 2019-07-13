//
//  NetWorkUtilityTest.swift
//  MianshiTiTests
//
//  Created by Qiqiuzhe on 2019/7/13.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

import XCTest

class NetWorkUtilityTest: XCTestCase {
    var nu: NetUtility!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        nu = NetUtility()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        nu = nil
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNotNil(nu)
    }
    
    func testLoadData() -> Void {
        let expectation = XCTestExpectation(description: "response")
        nu.loadData(searchWord: "urlprotocol") {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }

    func testMakeRequest() throws -> Void {
        let urlRequest = try nu.makeRequest(1, searchWord: "urlprotocol")
        XCTAssertEqual(urlRequest.url?.scheme, "https")
        XCTAssertEqual(urlRequest.url?.host, "www.baidu.com")
        XCTAssertEqual(urlRequest.url?.query, "q=\("urlprotocol")")
    }
    
    func testLoadSuccess() -> Void {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: configuration)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
