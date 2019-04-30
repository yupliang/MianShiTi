//
//  List.h
//  MianshiTi
//
//  Created by QiQiuZhe on 2019/4/27.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

NS_ASSUME_NONNULL_BEGIN

@interface List : NSObject

@property (nonatomic,strong) Node *head;
@property (nonatomic,strong) Node *tail;

- (void)tailAppend:(NSInteger)value;
- (void)headInsert:(NSInteger)value;
- (void)changeListByValue:(NSInteger)value;
- (void)logFullList;

@end

NS_ASSUME_NONNULL_END
