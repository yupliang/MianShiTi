//
//  LFUCache.m
//  MianshiTiTests
//
//  Created by yupeiliang on 2019/6/10.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

#import "LFUCache.h"
#import "List.h"

@implementation LFUCache

- (id)initWithCapacity:(NSInteger)capacity {
    self = [super init];
    if (self) {
        _capacity = capacity;
        _keyValueFreqListPairdic = [[NSMutableDictionary alloc] initWithCapacity:capacity];
        _freqListDic = [[NSMutableDictionary alloc] initWithCapacity:capacity];
        _minFreq = 0;
        _keyNodeDic = [[NSMutableDictionary alloc] initWithCapacity:capacity];
    }
    return self;
}

- (void)putValue:(NSInteger)value forKey:(NSString *)key {
    if (_keyValueFreqListPairdic.count >= _capacity) {
        //TODO: 删除_minFreq对应list中的最前边元素
        List *l = [_freqListDic objectForKey:@(_minFreq)];
        [_keyNodeDic removeObjectForKey:l.head.data];
        [_keyValueFreqListPairdic removeObjectForKey:l.head.data];
        [l removeNode:l.head];
        if ([l head] == nil) {
            _minFreq++;
        }
    }
    NSNumber *n = [_keyValueFreqListPairdic objectForKey:key];
    if (n) {
        NSInteger f_now = [[[_keyValueFreqListPairdic objectForKey:key] objectForKey:@"freqListKey"] integerValue];
        [[_keyValueFreqListPairdic objectForKey:key] setObject:@(f_now+1) forKey:@"freqListKey"];
        List *l = [_freqListDic objectForKey:@(f_now)];
        [l removeNode:(Node *)[_keyNodeDic objectForKey:key]];
        l = [_freqListDic objectForKey:@(f_now+1)];
        if (!l) {
            l = [List new];
            [_freqListDic setObject:l forKey:@(f_now+1)];
        }
        [l tailAppendO:key];
        return;
    }
    //TODO: {value,1} minFreq = 1
    [_keyValueFreqListPairdic setValue:[@{@"value":@(value),@"freqListKey":@(1)} mutableCopy] forKey:key];
    List *l = [_freqListDic objectForKey:@(1)];
    if (!l) {
        l = [List new];
        [_freqListDic setObject:l forKey:@(1)];
    }
    [l tailAppendO:key];
    [_keyNodeDic setObject:l.tail forKey:key];
    _minFreq = 1;
}

- (NSInteger)getValueForKey:(NSString *)key {
    NSMutableDictionary *n = [_keyValueFreqListPairdic objectForKey:key];
    if (n) {
        NSInteger f_now = [[[_keyValueFreqListPairdic objectForKey:key] objectForKey:@"freqListKey"] integerValue];
        [[_keyValueFreqListPairdic objectForKey:key] setObject:@(f_now+1) forKey:@"freqListKey"];
        List *l = [_freqListDic objectForKey:@(f_now)];
        [l removeNode:(Node *)[_keyNodeDic objectForKey:key]];
        l = [_freqListDic objectForKey:@(f_now+1)];
        if (!l) {
            l = [List new];
            [_freqListDic setObject:l forKey:@(f_now+1)];
        }
        [l tailAppendO:key];
        return [[n objectForKey:@"value"] integerValue];
    }
    return -1;
}

@end
