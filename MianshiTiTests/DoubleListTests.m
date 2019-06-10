//
//  DoubleListTests.m
//  MianshiTiTests
//
//  Created by Qiqiuzhe on 2019/5/25.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DoubleLinkedList.h"

@interface DoubleListTests : XCTestCase {
    DoubleLinkedList *list;
}

@end

@implementation DoubleListTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    list = [DoubleLinkedList new];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    list = nil;
}

- (void)testLogic {
    DLLNode *node = [DLLNode new];
    node.data = @1;
    [list insertNodeToHead:node];
    XCTAssertEqualObjects(list.head, node);
    XCTAssertEqualObjects(list.tail, node);
    DLLNode *node2 = [DLLNode new];
    node.data = @2;
    [list insertNodeToHead:node2];
    XCTAssertEqualObjects(node2, node.preNode);
    XCTAssertEqualObjects(list.head, node2);
    XCTAssertEqualObjects(node2.nextNode, node);
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
