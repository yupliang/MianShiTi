//
//  DoubleLinkedList.h
//  MianshiTi
//
//  Created by Qiqiuzhe on 2019/5/24.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DLLNode.h"

NS_ASSUME_NONNULL_BEGIN

@interface DoubleLinkedList : NSObject

@property (nonatomic,strong,nullable) DLLNode *head;
@property (nonatomic,strong,nullable) DLLNode *tail;

- (void)insertNodeToHead:(DLLNode *)node;
- (void)removeLastItem;
@end

NS_ASSUME_NONNULL_END
