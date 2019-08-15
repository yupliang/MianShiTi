//
//  ClassicProblemTests.m
//  MianshiTiTests
//
//  Created by Qiqiuzhe on 2019/8/15.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BTreeProblemOC.h"

@interface ClassicProblemTests : XCTestCase

@property (nonatomic,strong) BTreeProblemOC *btp;

@end

@implementation ClassicProblemTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.btp = [BTreeProblemOC new];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.btp = nil;
}

- (void)testBTree {
    BinaryTree *aTree = [BinaryTree new];
    [aTree createTree:[@[@(8),@(3),@(1),@(NSIntegerMax),@(NSIntegerMax),@(6),@(4),@(NSIntegerMax),@(NSIntegerMax),@(7),@(NSIntegerMax),@(NSIntegerMax),@(10),@(NSIntegerMax),@(14),@(13),@(NSIntegerMax),@(NSIntegerMax),@(NSIntegerMax)] mutableCopy]];
    
    NSString *result = [self.btp preorderNonrecursive:aTree];
    XCTAssertEqualObjects(result, @"8->3->1->6->4->7->10->14->13");
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
