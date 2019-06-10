//
//  ListTest.m
//  MianshiTiTests
//
//  Created by yupeiliang on 2019/6/10.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "List.h"

@interface ListTest : XCTestCase {
    List *_list;
}

@end

@implementation ListTest

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _list = [List new];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    _list = nil;
}

- (void)testRemoveNodes {
    [_list tailAppend:1];
    [_list tailAppend:2];
    [_list tailAppend:6];
    [_list tailAppend:3];
    [_list tailAppend:4];
    [_list tailAppend:5];
    [_list tailAppend:6];
    NSString *r = [_list logFullList];
    XCTAssertEqualObjects(r, @"1->2->6->3->4->5->6");
    [_list removeNodes:6];
    r = [_list logFullList];
    XCTAssertEqualObjects(r, @"1->2->3->4->5");
}

- (void)testRemoveNode {
    [_list tailAppend:1];
    [_list tailAppend:2];
    [_list tailAppend:6];
    [_list tailAppend:3];
    [_list tailAppend:4];
    [_list tailAppend:5];
    [_list tailAppend:6];
    [_list removeNode:_list.head];
    NSString *r = [_list logFullList];
    
    XCTAssertEqualObjects(r, @"2->6->3->4->5->6");
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
