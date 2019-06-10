//
//  LFUCache.h
//  MianshiTiTests
//
//  Created by yupeiliang on 2019/6/10.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LFUCache : NSObject {
    NSInteger _capacity;
    NSMutableDictionary *_keyValueFreqListPairdic;
    NSMutableDictionary *_freqListDic;
    NSInteger _minFreq;
    NSMutableDictionary *_keyNodeDic;
}

- (id)initWithCapacity:(NSInteger)capacity;
- (void)putValue:(NSInteger)value forKey:(NSString *)key;
- (NSInteger)getValueForKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
