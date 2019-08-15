//
//  StackOC.m
//  MianshiTi
//
//  Created by Qiqiuzhe on 2019/8/15.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

#import "StackOC.h"

@interface StackOC ()

// 存储栈数据
@property (nonatomic, strong) NSMutableArray *stackArray;

@end

@implementation StackOC

- (NSMutableArray *)stackArray {
    if (!_stackArray) {
        _stackArray = [NSMutableArray array];
    }
    return _stackArray;
}

- (void)push:(id)obj {
    [self.stackArray addObject:obj];
}

- (id)popObj {
    if ([self isEmpty]) {
        return nil;
    } else {
        id obj = [self.stackArray lastObject];
        [self.stackArray removeLastObject];
        return obj;
    }
}

- (BOOL)isEmpty {
    return !self.stackArray.count;
}

-(id)topObj {
    if ([self isEmpty]) {
        return nil;
    } else {
        return self.stackArray.lastObject;
    }
}

@end
