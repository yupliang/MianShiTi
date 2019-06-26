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

- (instancetype)init
{
    self = [super init];
    if (self) {
        _q = [Queue new];
    }
    return self;
}

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

- (void)createHeapTree:(NSMutableArray *)datas toParent:(nullable BinaryTreeNode *)aParent andChild:(NodeType)aside {
    if (datas.count == 0) return;
    BinaryTreeNode *aNode = [self addNode:[datas[0] integerValue] toParent:aParent andChild:aside];
    if (self.rootNode == nil) {
        self.rootNode = aNode;
        [_q enqueue:self.rootNode];
    }
    [datas removeObjectAtIndex:0];
    
    while (datas.count > 0) {
        aParent = (BinaryTreeNode *)[_q dequeue];
        aNode = [self addNode:[datas[0] integerValue] toParent:aParent andChild:left];
        [_q enqueue:aNode];
        [datas removeObjectAtIndex:0];
        if (datas.count > 0) {
            aNode = [self addNode:[datas[0] integerValue] toParent:aParent andChild:right];
            [_q enqueue:aNode];
            [datas removeObjectAtIndex:0];
        }
    }
}

- (void)heapifyWithDatas:(NSMutableArray *)datas parentIndex:(NSInteger)pIndex {
    if (pIndex > datas.count) return;
    NSInteger lIndex = pIndex*2 +1;
    NSInteger rIndex = pIndex*2+2;
    NSInteger max = pIndex;
    if (lIndex<datas.count && [datas[max] integerValue] < [datas[lIndex] integerValue]) {
        max = lIndex;
    }
    if (rIndex<datas.count && [datas[max] integerValue] < [datas[rIndex] integerValue]) {
        max = rIndex;
    }
    if (max != pIndex) {
        id temp = datas[pIndex];
        datas[pIndex] = datas[max];
        datas[max] = temp;
        [self heapifyWithDatas:datas parentIndex:max];
    }
}

- (void)createTree:(NSMutableArray *)datas {
    [self createTree:datas toParent:nil andChild:root];
}

- (void)createHeapTree:(NSMutableArray *)datas {
    int pIndex = (datas.count-1)/2;
    for (int i=pIndex; i>=0; i--) {
        [self heapifyWithDatas:datas parentIndex:i];
    }
    
    [self createHeapTree:datas toParent:nil andChild:root];
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
+ (NSString *)levelTree:(BinaryTree *)aTree {
    return [aTree _levelTree:aTree.rootNode];
}
+ (NSArray *)levelOrderNodeAndLRnode:(BinaryTree *)aTree {
    return [aTree _levelOrderNodeAndLRnode:aTree.rootNode];
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
- (NSString *)_levelTree:(BinaryTreeNode *)aNode {
    if (aNode == nil) return nil;
    Queue *aQueue = [Queue new];
    [aQueue enqueue:aNode];
    NSString *r = nil;
    int i=0;
    while (![aQueue isEmpty]) {
        BinaryTreeNode *n = (BinaryTreeNode *)[aQueue dequeue];
        NSLog(@"%d", n.data);
        if (i == 0) {
            i++;
            r = [NSString stringWithFormat:@"%d", n.data];
        } else {
            r = [NSString stringWithFormat:@"%@->%d", r,n.data];
        }
        if (n.leftNode != nil)
            [aQueue enqueue:n.leftNode];
        if (n.rightNode != nil)
            [aQueue enqueue:n.rightNode];
    }
    return r;
}

- (NSArray *)_levelOrderNodeAndLRnode:(BinaryTreeNode *)aNode {
    if (aNode == nil) return nil;
    NSMutableArray *arr = [NSMutableArray new];
    Queue *aQueue = [Queue new];
    [aQueue enqueue:aNode];
    while (![aQueue isEmpty]) {
        BinaryTreeNode *n = (BinaryTreeNode *)[aQueue dequeue];
        [arr addObject:[NSString stringWithFormat:@"%d->%@,%@", n.data,n.leftNode?[NSString stringWithFormat:@"%d",n.leftNode.data]:@"#",n.rightNode?[NSString stringWithFormat:@"%d",n.rightNode.data]:@"#"]];
        if (n.leftNode) {
            [aQueue enqueue:n.leftNode];
        }
        if (n.rightNode) {
            [aQueue enqueue:n.rightNode];
        }
    }
    
    return arr;
}

@end
