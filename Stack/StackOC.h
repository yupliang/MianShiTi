//
//  StackOC.h
//  MianshiTi
//
//  Created by Qiqiuzhe on 2019/8/15.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface StackOC : NSObject

/**
 入栈
 @param obj 指定入栈对象
 */
- (void)push:(id)obj;

/**
 出栈
 */
- (id)popObj;

/**
 是否为空
 */
- (BOOL)isEmpty;

/**
 返回栈顶元素
 */
-(id)topObj;


@end

NS_ASSUME_NONNULL_END
