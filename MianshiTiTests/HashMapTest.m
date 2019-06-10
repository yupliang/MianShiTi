//
//  HashMapTest.m
//  MianshiTiTests
//
//  Created by Qiqiuzhe on 2019/6/4.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HashMap.h"

@interface HashMapTest : XCTestCase {
    HashMap *_hm;
}

@end

@implementation HashMapTest

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _hm = [HashMap new];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    _hm = nil;
}

- (void)testNumberDes {
    XCTAssertEqualObjects([@(3) description], @"3");
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    [_hm put:6 andValue:6];
    [_hm put:9 andValue:9];
    [_hm put:13 andValue:13];
    XCTAssertEqual(-1, [_hm get:1]);
    XCTAssertEqual(-1, [_hm get:3]);
    [_hm put:1 andValue:1];
    [_hm put:3 andValue:3];
    XCTAssertEqual(1, [_hm get:1]);
    XCTAssertEqual(3, [_hm get:3]);
    [_hm put:3 andValue:10];
    XCTAssertEqual(10, [_hm get:3]);
    [_hm remove:3];
    XCTAssertEqual(-1, [_hm get:3]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
