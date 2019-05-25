//
//  DLLNode.h
//  MianshiTi
//
//  Created by Qiqiuzhe on 2019/5/24.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DLLNode : NSObject

@property (nonatomic,strong,nullable) DLLNode *preNode;
@property (nonatomic,strong,nullable) DLLNode *nextNode;
@property (nonatomic,strong) id data;

@end

NS_ASSUME_NONNULL_END
