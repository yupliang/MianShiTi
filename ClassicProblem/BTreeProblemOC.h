//
//  BTreeProblemOC.h
//  MianshiTi
//
//  Created by Qiqiuzhe on 2019/8/15.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BinaryTree.h"

NS_ASSUME_NONNULL_BEGIN

@interface BTreeProblemOC : NSObject

- (NSString *)preorderNonrecursive:(BinaryTree *)tree;
- (NSString *)inorderNonrecursive:(BinaryTree *)tree;

@end

NS_ASSUME_NONNULL_END
