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
    dic = [[NSMutableDictionary alloc] initWithCapacity:capacity];
    objs = [[NSMutableArray alloc] initWithCapacity:capacity];
    return self;
}

- (void)setItem:(id)item forKey:(NSString *)key {
    if ([objs containsObject:key]) {
        [objs removeObject:key];
        [objs insertObject:key atIndex:0];
        [dic setValue:item forKey:key];
    } else {
        if (objs.count == 2) {
            [dic setValue:nil forKey:[objs lastObject]];
        }
        [objs insertObject:key atIndex:0];
        [dic setValue:item forKey:key];
    }
}

- (id)getItemForKey:(NSString *)key {
    if (![objs containsObject:key]) return @(-1);
    [objs removeObject:key];
    [objs insertObject:key atIndex:0];
    return dic[key];
}

- (NSInteger)count {
    return [dic count];
}
@end
