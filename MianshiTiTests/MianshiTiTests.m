//
//  MianshiTiTests.m
//  MianshiTiTests
//
//  Created by QiQiuZhe on 2019/4/27.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Queue.h"

@interface MianshiTiTests : XCTestCase

@end

@implementation MianshiTiTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    Queue *queue = [Queue new];
    XCTAssertTrue([queue isEmpty]);
    NSObject *o1 = [NSObject new];
    NSObject *o2 = [NSObject new];
    [queue enqueue:o1];
    [queue enqueue:o2];
    
    XCTAssertEqualObjects(o1, [queue peek]);
    [queue dequeue];
    XCTAssertEqualObjects(o2, [queue peek]);
    XCTAssertThrowsSpecificNamed([queue enqueue:nil], NSException, @"参数错误");
    XCTAssertThrows([queue enqueue:nil]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
