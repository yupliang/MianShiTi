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
    return self;
}

- (void)setItem:(id)item forKey:(NSString *)key {
    [dic setValue:item forKey:key];
}

- (id)getItemForKey:(NSString *)key {
    return dic[key];
}

- (NSInteger)count {
    return [dic count];
}
@end
