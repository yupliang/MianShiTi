//
//  EqualObject.m
//  MianshiTi
//
//  Created by yupeiliang on 2019/5/28.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

#import "EqualObject.h"

@implementation EqualObject

- (BOOL)isEqual: (EqualObject *)other
{
    if (self == other) return YES;
//    if (![self isKindOf: other.class] && ![other isKindOf:self.class]) return NO;
    if (self.hash != other.hash) return NO;
    if (self._length != other._length) return NO;
    if (self._name != other._name && ![self._name isEqual:other._name]) return NO; // 继续引用对象的hash判断
    if (_data != other->_data && !memcmp(_data, other->_data, self._length)) return NO;
    return YES;
}

@end
