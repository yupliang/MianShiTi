//
//  RuntimeTest.m
//  MianshiTiTests
//
//  Created by yupeiliang on 2019/5/23.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "aa.h"
#import <objc/runtime.h>
#import <malloc/malloc.h>

@interface RuntimeTest : XCTestCase
{
    Person *person;
}
@end

@implementation RuntimeTest

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    person = [Person new];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    person = nil;
}

- (void)testSize {
    NSObject *obj = [NSObject new];
    NSLog(@"malloc size %zu", malloc_size((__bridge const void *)(obj)));
    NSLog(@"size of obj %zu", sizeof(obj));
    
    XCTAssertTrue(8==class_getInstanceSize([NSObject class]), @"实际使用大小 %zu",class_getInstanceSize([NSObject class]));
    
    Person *person = [[Person alloc] init];
    //    NSLog(@"name size %lu", sizeof(person->_name));
    //    NSLog(@"age size %ld", sizeof(person->_age));
    //    NSLog(@"isa %ld", sizeof(person));
    ////    NSLog(@"---%zd", class_getInstanceSize([Person class]));
    NSLog(@"---%zd", malloc_size((__bridge const void *)person));
    XCTAssertTrue(32==malloc_size((__bridge const void *)person));
    XCTAssertTrue(28==class_getInstanceSize([Person class]), @"实际使用大小 %zu",class_getInstanceSize([Person class]));
    //    Student *stu = [[Student alloc] init];
    //
    //    NSLog(@"%zd", class_getInstanceSize([Student class]));
    //    NSLog(@"%zd", malloc_size((__bridge const void *)stu));
}

- (void)testResolveInstanceMethod {
    [person performSelector:@selector(study) withObject:nil afterDelay:0];
}
- (void)testArchive {
    person->_age = 18;
    NSString *path = [NSString stringWithFormat:@"%@/%@", NSHomeDirectory(),@"aa"];
    [NSKeyedArchiver archiveRootObject:person toFile:path];
    
    person = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    XCTAssertTrue(person->_age==18, "was %d",person->_age);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
