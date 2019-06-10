//
//  HashMap.m
//  MianshiTi
//
//  Created by Qiqiuzhe on 2019/6/4.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

#import "HashMap.h"
#import "Node.h"
#import "List.h"

@implementation HashMap

- (instancetype)init
{
    self = [super init];
    if (self) {
        _arr = [NSMutableArray arrayWithCapacity:10];
        for (int i=0; i<1000000; i++) {
            [_arr addObject:[List new]];
        }
    }
    return self;
}

- (int)getHash:(NSObject *)obj {
    return [obj hash] % 10000;
}

- (void)put:(int)key andValue:(int)value {
    NSInteger aH = [self getHash:@(key)];
    NSLog(@"put ah %ld", (long)aH);
    List *aList = _arr[aH];
    if (aList == nil) {
        aList = [List new];
        [_arr replaceObjectAtIndex:aH withObject:aList];
    }
    Node *aNode = aList.head;
    while (aNode) {
        if ([((NSDictionary *)aNode.data) objectForKey:[@(key) description]] != nil) {
            [((NSDictionary *)aNode.data) setValue:@(value) forKey:[@(key) description]];
            return;
        }
        aNode = aNode.next;
    }
    [aList tailAppendO:[@{[@(key) description]:@(value)} mutableCopy]];
}

- (int)get:(int)key {
    NSInteger aH = [self getHash:@(key)];
    List *aList = _arr[aH];
    if (aList == nil) {
        aList = [List new];
    }
    Node *aNode = aList.head;
    while (aNode) {
        if ([((NSDictionary *)aNode.data) objectForKey:[@(key) description]] != nil) {
            return [[((NSDictionary *)aNode.data) objectForKey:[@(key) description]] intValue];
        }
        aNode = aNode.next;
    }
    return -1;
}

- (void)remove:(int)key {
    NSInteger aH = [self getHash:@(key)];
    List *aList = _arr[aH];
    if (aList != nil) {
        Node *aNode = aList.head;
        while (aNode) {
            if ([((NSDictionary *)aNode.data) objectForKey:[@(key) description]] != nil) {
                [((NSMutableDictionary *)aNode.data) removeObjectForKey:[@(key) description]];
                return ;
            }
            aNode = aNode.next;
        }
    }
}

@end
