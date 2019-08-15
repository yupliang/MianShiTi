//
//  BTreeProblemOC.m
//  MianshiTi
//
//  Created by Qiqiuzhe on 2019/8/15.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

#import "BTreeProblemOC.h"
#import "StackOC.h"

@implementation BTreeProblemOC

- (NSString *)preorderNonrecursive:(BinaryTree *)tree {
    StackOC *stack = [StackOC new];
    [stack push:tree.rootNode];
    BinaryTreeNode *node = (BinaryTreeNode *)[stack topObj];
    
    return @"";
}

@end
