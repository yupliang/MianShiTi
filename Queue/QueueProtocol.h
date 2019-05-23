//
//  QueueProtocol.h
//  MianshiTi
//
//  Created by Qiziuzhe on 2019/5/1.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol QueueProtocol <NSObject>

- (void)enqueue:(NSObject *)aObj;
- (NSObject *)dequeue;
- (NSObject *)peek;
- (NSInteger)size;
- (BOOL)isEmpty;

@end

NS_ASSUME_NONNULL_END
