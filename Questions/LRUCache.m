//
//  LRUCache.m
//  MianshiTi
//
//  Created by yupeiliang on 2019/5/23.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

#import "LRUCache.h"
#import "DoubleLinkedList.h"

@implementation LRUCache

- (id)initWithCapacity:(NSInteger)capacity {
    self = [super init];
    dic = [[NSMutableDictionary alloc] initWithCapacity:capacity];
#ifdef O1
    list = [[DoubleLinkedList alloc] init];
    _capacity = capacity;
#else
    objs = [[NSMutableArray alloc] initWithCapacity:capacity];
#endif
    return self;
}

- (void)setItem:(id)item forKey:(NSString *)key {
#ifdef O1
    if ([dic valueForKey:key] != nil) {
        ((DLLNode *)dic[key]).data = @{@"k":key,@"d":item};
        [list insertNodeToHead:dic[key]];
        [dic setObject:item forKey:key];
    } else {
        if (dic.allKeys.count == _capacity) {
            [dic removeObjectForKey:list.tail.data[@"k"]];
            [list removeLastItem];
        }
        
        DLLNode *node = [DLLNode new];
        node.data = @{@"k":key,@"d":item};
        [dic setObject:node forKey:key];
        [list insertNodeToHead:node];
    }
#else
    if ([objs containsObject:key]) {
        [objs removeObject:key];
        [objs insertObject:key atIndex:0];
        [dic setValue:item forKey:key];
    } else {
        if (objs.count == 2) {
            [dic setValue:nil forKey:[objs lastObject]];
            [objs removeLastObject];
        }
        [objs insertObject:key atIndex:0];
        [dic setValue:item forKey:key];
    }
#endif
    
}

- (id)getItemForKey:(NSString *)key {
#ifdef O1
    if (![dic objectForKey:key]) return @(-1);
    [list insertNodeToHead:dic[key]];
#else
    if (![objs containsObject:key]) return @(-1);
    [objs removeObject:key];
    [objs insertObject:key atIndex:0];
#endif
    
    return ((DLLNode *)dic[key]).data[@"d"];
}

- (NSInteger)count {
    return [dic count];
}
@end
