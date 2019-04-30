//
//  BinaryTree.h
//  MianshiTi
//
//  Created by QiQiuZhe on 2019/4/29.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BinaryTreeNode.h"

typedef enum : NSUInteger {
    root,
    left,
    right,
} NodeType;

typedef enum : NSUInteger {
    preOrder,
    inOrder,
    afterOrder,
} BinaryTreeOrder;

NS_ASSUME_NONNULL_BEGIN

@interface BinaryTree : NSObject {
    NSInteger _index;
}

@property (nonatomic,strong) BinaryTreeNode *rootNode;

- (nullable BinaryTreeNode *)addNode:(NSInteger)data toParent:(nullable BinaryTreeNode *)aParent andChild:(NodeType)aside;
- (void)createTree:(NSMutableArray *)datas toParent:(nullable BinaryTreeNode *)aParent andChild:(NodeType)aside;
- (void)createTree:(NSMutableArray *)datas;
@end

NS_ASSUME_NONNULL_END
