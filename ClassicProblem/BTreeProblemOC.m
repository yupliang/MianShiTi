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
    
    NSString *result = @"";
    
    StackOC *stack = [StackOC new];
    [stack push:tree.rootNode];
    BinaryTreeNode *node = (BinaryTreeNode *)[stack topObj];
    while (stack.isEmpty == false) {
        while (stack.isEmpty == false) {
            BinaryTreeNode *node = [stack topObj];
            if (result.length > 0) {
                result = [NSString stringWithFormat:@"%@->%d", result,node.data];
            } else {
                result = [NSString stringWithFormat:@"%d", node.data];
            }
            if (node.leftNode != nil) {
                [stack push:node.leftNode];
            } else {
                break;
            }
        }
        
        BinaryTreeNode *top = [stack popObj];
        while (top.rightNode == nil && stack.isEmpty==false) {
            top = [stack popObj];
        }
        if (top.rightNode == nil) {
            break;
        } else {
            [stack push:top.rightNode];
        }
    }
    return result;
}

- (NSString *)inorderNonrecursive:(BinaryTree *)tree {
    NSString *result = @"";
    return result;
}

@end
