//
//  BinaryTree.m
//  MianshiTi
//
//  Created by 于培亮 on 2019/4/29.
//  Copyright © 2019 于培亮. All rights reserved.
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
    if (datas.count > 0 && [datas[0] integerValue] != NSIntegerMax) {
        [self createTree:datas toParent:aNode andChild:left];
    }
    if (datas.count == 0) {
        return;
    }
    [datas removeObjectAtIndex:0];
    if (datas.count > 0 && [datas[0] integerValue] != NSIntegerMax) {
        [self createTree:datas toParent:aNode andChild:right];
    }
    if (datas.count == 0) return;
    [datas removeObjectAtIndex:0];
//    _index++;
//    if (_index < datas.count)
//        [self addNode:[datas[_index] integerValue] toParent:aNode andChild:left];;
//    _index++;
//    if (_index < datas.count)
//        [self addNode:[datas[_index] integerValue] toParent:aNode andChild:right];
}

- (void)createTree:(NSMutableArray *)datas {
    [self createTree:datas toParent:nil andChild:root];
}

@end
