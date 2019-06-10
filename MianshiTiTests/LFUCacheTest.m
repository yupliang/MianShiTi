//
//  LFUCacheTest.m
//  MianshiTiTests
//
//  Created by yupeiliang on 2019/6/10.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LFUCache.h"

@interface LFUCacheTest : XCTestCase {
    LFUCache *_cache;
}

@end

@implementation LFUCacheTest

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _cache = [[LFUCache alloc] initWithCapacity:2];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    _cache = nil;
}

- (void)testLogic {
    [_cache putValue:1 forKey:@"1"];
    [_cache putValue:2 forKey:@"2"];
    
    XCTAssertEqual(1, [_cache getValueForKey:@"1"]);
    [_cache putValue:3 forKey:@"3"];
    XCTAssertEqual(-1, [_cache getValueForKey:@"2"]);
    [_cache putValue:4 forKey:@"4"];
    XCTAssertEqual(-1, [_cache getValueForKey:@"3"]);
    XCTAssertEqual(1, [_cache getValueForKey:@"1"]);
    XCTAssertEqual(4, [_cache getValueForKey:@"4"]);
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
