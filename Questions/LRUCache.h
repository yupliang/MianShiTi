//
//  LRUCache.h
//  MianshiTi
//
//  Created by yupeiliang on 2019/5/23.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LRUCache : NSObject {
    NSMutableDictionary *dic;
    NSMutableArray *objs;//0，1，2...最近、次近、、、
}

- (id)initWithCapacity:(NSInteger)capacity;
- (void)setItem:(id)item forKey:(NSString *)key;
- (id)getItemForKey:(NSString *)key;
- (NSInteger)count;
@end

NS_ASSUME_NONNULL_END
