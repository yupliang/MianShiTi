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
#import "Example.h"

#define TESTDefine \
"aa"\
"bbb"

@interface MianshiTiTests : XCTestCase

@property (nonatomic,strong) BigData *bdata;
@property (nonatomic, strong) NSMutableData *data;


@end

@implementation MianshiTiTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.bdata = [BigData new];
}

- (void)testDefine {
    NSLog(@"TESTDefine %s", TESTDefine);//\
    NSLog(<#NSString * _Nonnull format, ...#>)
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

- (void)testMainThread {
    NSString *queueBaseLabel = [NSString stringWithFormat:@"com.ioschengxuyuan.%@", NSStringFromClass([self class])];
    const char *queueName = [[NSString stringWithFormat:@"%@.ForTest",queueBaseLabel] UTF8String];
    dispatch_queue_t _queue = dispatch_queue_create(queueName, NULL);
    dispatch_sync(_queue, ^{
        NSLog(@"current thread is %@",[NSThread currentThread]);
    });
}

- (void)testSwitchToMainThread {
    //为了证明，switchToMainThread 中 if 和else是不等价的。我们做如下实现：
    //同样都是在主线程操作，队列不同，结果截然不同。
    // 请猜测结果1和结果2的差异
    
    NSString *queueBaseLabel = [NSString stringWithFormat:@"com.ioschengxuyuan.%@", NSStringFromClass([self class])];
    const char *queueName = [[NSString stringWithFormat:@"%@.ForTest",queueBaseLabel] UTF8String];
    dispatch_queue_t _queue1 = dispatch_queue_create(queueName, DISPATCH_QUEUE_CONCURRENT);//DISPATCH_QUEUE_CONCURRENT);
    for (int i = 0; i < 1000000; i++) {
        dispatch_async(_queue1, ^(void) {
            self.data = [NSMutableData new];
        });
        NSString *queueBaseLabel2 = [NSString stringWithFormat:@"com.ioschengxuyuan.%@.%@", NSStringFromClass([self class]), @(i)];
        const char *queueName2 = [[NSString stringWithFormat:@"%@.ForTest",queueBaseLabel2] UTF8String];
        dispatch_queue_t _queue2 = dispatch_queue_create(queueName2, NULL);
         dispatch_sync(_queue1,^{      //注释本行，出现结果1
//        dispatch_sync(_queue2,^{      //注释本行，出现结果2
            [self switchToMainThread];
        });
    }
}

- (void)switchToMainThread {
    if ([NSThread isMainThread]) {
        self.data = [NSMutableData new];
    } else {
        dispatch_sync(dispatch_get_main_queue(), ^(void) {
            self.data = [NSMutableData new];
        });
    }
}

- (void)testObjType{
    NSArray *arr = @[@1,[NSObject new]];
    XCTAssertEqual(2, arr.count);
    NSLog(@"encod 1 %s 2 %s", @encode(typeof(arr[0])),@encode(NSObject *));
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        for (int i=0; i<1000000; i++) {
            double_num_asm(i);
        }
    }];
}

- (void)testPerformanceDoubleNum {
    [self measureBlock:^{
        for (int i=0; i<1000000; i++) {
            double_num(i);
        }
    }];
}

int double_num(int num) {
    return num * 2;
}

int double_num_asm(int num) {
    __asm("nop");
    __asm__ __volatile__(
    "lsl x0,x0,1\n"
                         "str x0,[sp,#12]\n"
    );
    __asm("nop");
    return num;
}

int double_num_times1(int num, int times) {
    int ret;
    __asm__ __volatile__(
        "lsl x0,x0,x1\n"
                         "mov %0,x0"
                         :"=r"(ret)
                         :
                         :
    );
    return ret;
}

- (void)testAsm {
    int r = double_num_asm(2);
    XCTAssertEqual(4, r);
}

- (void)testTimesNum {
    int r = double_num_times1(4,2);
    XCTAssertEqual(16, r);
}

- (void)testPureAsm {
    __asm("nop");
    int r = double_num_times_asm(5, 3);
    __asm("nop");
    XCTAssertEqual(40, r);
}

@end
