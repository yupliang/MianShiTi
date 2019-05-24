//
//  LRUCache.m
//  MianshiTi
//
//  Created by yupeiliang on 2019/5/23.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

#import "LRUCache.h"

@implementation LRUCache

- (id)initWithCapacity:(NSInteger)capacity {
    self = [super init];
    _capacity = capacity;
    dic = [[NSMutableDictionary alloc] initWithCapacity:capacity];
    return self;
}

- (void)setItem:(id)item forKey:(NSString *)key {
    if (dic.count == _capacity) {
        [dic setValue:nil forKey:dic.allKeys[0]];
    }
    [dic setValue:item forKey:key];
}

- (id)getItemForKey:(NSString *)key {
    return dic[key];
}

- (NSInteger)count {
    return [dic count];
}
@end
