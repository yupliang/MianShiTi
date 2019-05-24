//
//  LRUCacheTest.m
//  MianshiTiUITests
//
//  Created by yupeiliang on 2019/5/23.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LRUCache.h"

@interface LRUCacheTest : XCTestCase
{
    LRUCache *cache;
}
@end

@implementation LRUCacheTest

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    cache = [[LRUCache alloc] initWithCapacity:4];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    cache = nil;
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testMethods {
    XCTAssertNotNil(cache);
    [cache setItem:@(5) forKey:@"f"];
    id v = [cache getItemForKey:@"f"];
    XCTAssertEqualObjects(@(5), v);
    XCTAssertNil([cache getItemForKey:@"a"]);
    [cache setItem:@(7) forKey:@"ff"];
    [cache setItem:@(7) forKey:@"fff"];
    [cache setItem:@(7) forKey:@"ffff"];
    [cache getItemForKey:@"ff"];
    [cache setItem:@(7) forKey:@"fffff"];
    XCTAssertLessThanOrEqual([cache count], 4);
    XCTAssertNotNil([cache getItemForKey:@"ff"]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
