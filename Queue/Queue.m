//
//  Queue.m
//  MianshiTi
//
//  Created by Qiziuzhe on 2019/5/1.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

#import "Queue.h"

@interface Queue () {
    NSMutableArray *_container;
}

@end

@implementation Queue

- (instancetype)init
{
    self = [super init];
    if (self) {
        _container = [NSMutableArray new];
    }
    return self;
}

- (nonnull NSObject *)dequeue { 
    if ([self isEmpty]) return nil;
    NSObject *obj = _container[0];
    [_container removeObjectAtIndex:0];
    return obj;
}

- (void)enqueue:(nonnull NSObject *)aObj {
    if (aObj == nil) @throw [[NSException alloc] initWithName:@"参数错误" reason:@"enqueue obj can't be nil" userInfo:nil];
    [_container addObject:aObj];
}

- (BOOL)isEmpty { 
    return [_container count] == 0;
}

- (nonnull NSObject *)peek {
    if ([self isEmpty]) return nil;
    return [_container objectAtIndex:0];
}

- (NSInteger)size { 
    return [_container count];
}

- (void)dealloc
{
    NSLog(@"queue dealloc");
}
@end
