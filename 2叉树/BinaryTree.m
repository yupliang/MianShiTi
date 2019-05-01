//
//  BinaryTree.m
//  MianshiTi
//
//  Created by QiQiuZhe on 2019/4/29.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

#import "BinaryTree.h"
#import "Queue.h"

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

+ (void)dlrTree:(BinaryTree *)aTree {
    if (aTree == nil) return;
    
    [aTree _dlrTree:aTree.rootNode];
}
+ (void)ldrTree:(BinaryTree *)aTree {
    if (aTree == nil) return;
    [aTree _ldrTree:aTree.rootNode];
}
+ (void)lrdTree:(BinaryTree *)aTree {
    if (aTree == nil) return;
    [aTree _lrdTree:aTree.rootNode];
}
+ (void)levelTree:(BinaryTree *)aTree {
    [aTree _levelTree:aTree.rootNode];
}
//MARK: private methods
- (void)_dlrTree:(BinaryTreeNode *)aNode {
    if (aNode == nil) return;
    NSLog(@"%d", aNode.data);
    [self _dlrTree:aNode.leftNode];
    [self _dlrTree:aNode.rightNode];
}
- (void)_ldrTree:(BinaryTreeNode *)aNode {
    if (aNode == nil) return;
    [self _ldrTree:aNode.leftNode];
    NSLog(@"%d", aNode.data);
    [self _ldrTree:aNode.rightNode];
}
- (void)_lrdTree:(BinaryTreeNode *)aNode {
    if (aNode == nil) return;
    [self _lrdTree:aNode.leftNode];
    [self _lrdTree:aNode.rightNode];
    NSLog(@"%d", aNode.data);
}
- (void)_levelTree:(BinaryTreeNode *)aNode {
    if (aNode == nil) return;
    Queue *aQueue = [Queue new];
    [aQueue enqueue:aNode];
    while (![aQueue isEmpty]) {
        BinaryTreeNode *n = (BinaryTreeNode *)[aQueue dequeue];
        NSLog(@"%d", n.data);
        if (n.leftNode != nil)
            [aQueue enqueue:n.leftNode];
        if (n.rightNode != nil)
            [aQueue enqueue:n.rightNode];
    }
}

@end
