//
//  MockURLProtocol.swift
//  MianshiTi
//
//  Created by Qiqiuzhe on 2019/7/13.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

import Foundation

class MockURLProtocol: URLProtocol {
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    override func startLoading() {
        
    }
    override func stopLoading() {
        
    }
}
