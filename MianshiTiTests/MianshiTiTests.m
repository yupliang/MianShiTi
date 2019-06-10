//
//  MianshiTiTests.m
//  MianshiTiTests
//
//  Created by QiQiuZhe on 2019/4/27.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Queue.h"
#import "BigData.h"

@interface MianshiTiTests : XCTestCase

@property (nonatomic,strong) BigData *bdata;

@end

@implementation MianshiTiTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.bdata = [BigData new];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.bdata = nil;
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

- (void)testAddTwoData {
    NSArray *result = [self.bdata addData:@[@(1234),@(5678)] AndData2:@[@(6798),@(1234)]];
    NSString *resultStr = [NSString stringWithFormat:@"%@%@",result[0],result[1]];
    XCTAssertEqualObjects(resultStr, @"80326912", @"result is %@", resultStr);
    result = [self.bdata addData:@[@(1234),@(5678)] AndData2:@[@(4567)]];
    resultStr = [self.bdata outPutBigData:result];
    XCTAssertEqualObjects(resultStr, @"12350245");
    result = [self.bdata addData:@[] AndData2:@[@99,@9999]];
    XCTAssertEqualObjects([self.bdata outPutBigData:result], @"999999");
    result = [self.bdata addData:@[@123,@9899] AndData2:@[@99,@9999]];
    XCTAssertEqualObjects([self.bdata outPutBigData:result], @"2239898");
    result = [self.bdata addData:@[@9999,@9999] AndData2:@[@9999,@9999]];
    XCTAssertEqualObjects([self.bdata outPutBigData:result], @"199999998");
    result = [self.bdata addData:@[@9999,@9999,@9999,@9999,@9999,@9999,@9999] AndData2:@[@9999,@9999,@9999,@9999,@9999,@9999,@9999]];
    XCTAssertEqualObjects([self.bdata outPutBigData:result], @"19999999999999999999999999998");
}

- (void)testisKindOfClass {
    NSObject *obj = [NSObject new];
    XCTAssertFalse([obj isKindOfClass:[NSString class]]);
    NSString *str = @"hi";
    XCTAssertTrue([str isKindOfClass:[NSObject class]]);
    char *a = "abc";
    char *b = "abc";
    XCTAssertTrue(sizeof(a)==8);
    XCTAssertTrue(!memcmp(a, b, 3));
    XCTAssertTrue(-1);
}

- (void)testiSEqual {
    NSString *str = [NSMutableString stringWithFormat:@"AA"];
    NSString *str1 = @"AA";
    
    XCTAssertTrue([str isEqual:str1]);
    XCTAssertTrue([str isEqualToString:str1]);
    XCTAssertTrue(str == str1);
}

- (void)testHelloWorld {
//    NSLog(@"Goodbye World"); //
//    #define NSLog(x) NSLog(@"Goodbye World");
    
    NSString *a = @"Hello world";
    NSString *b = @"bye";
    memmove((void *)(@"Hello world"),(void *)(@"Goodbye world"),17);//此处17为随意填写，并无特定含义，请查看下文完整的取值计算方案。
    NSString *c = @"ok";
    
    NSLog(@"Hello world");
    NSLog(@"ok");
    NSLog(@"bye");

    char str[] = "memmove can be very useful......";
    memmove (str+20,str+15,11);
    NSLog(@"-- %s", str);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
