//
//  BinaryTree.m
//  MianshiTi
//
//  Created by QiQiuZhe on 2019/4/29.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

#import "BinaryTree.h"

@implementation BinaryTree

- (BinaryTreeNode *)addNode:(NSInteger)data toParent:(BinaryTreeNode *)aParent andChild:(NodeType)aside {
    if (data == NSIntegerMax) return nil;
    BinaryTreeNode *aNode = [BinaryTreeNode new];
    aNode.data = data;
    switch (aside) {
        case root:
            
            break;
        case left:
            aParent.leftNode = aNode;
            break;
        case right:
            aParent.rightNode = aNode;
            break;
        default:
            break;
    }
    return aNode;
}

//MARK:前序遍历方式进行创建
- (void)createTree:(NSMutableArray *)datas toParent:(nullable BinaryTreeNode *)aParent andChild:(NodeType)aside {
    if (datas.count == 0) return;
    BinaryTreeNode *aNode = [self addNode:[datas[0] integerValue] toParent:aParent andChild:aside];
    if (self.rootNode == nil) {
        self.rootNode = aNode;
    }
    [datas removeObjectAtIndex:0];
    
    if (aNode != nil) {
        [self createTree:datas toParent:aNode andChild:left];
        [self createTree:datas toParent:aNode andChild:right];
    }
}

- (void)createTree:(NSMutableArray *)datas {
    [self createTree:datas toParent:nil andChild:root];
}

@end
