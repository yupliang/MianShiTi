//
//  BinaryTree.h
//  MianshiTi
//
//  Created by QiQiuZhe on 2019/4/29.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BinaryTreeNode.h"
#import "Queue.h"

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
    Queue *_q;
}

@property (nonatomic,strong) BinaryTreeNode *rootNode;

- (void)createTree:(NSMutableArray *)datas;
- (void)createHeapTree:(NSMutableArray *)datas;
+ (void)dlrTree:(BinaryTree *)aTree;
+ (void)ldrTree:(BinaryTree *)aTree;
+ (void)lrdTree:(BinaryTree *)aTree;
+ (NSString *)levelTree:(BinaryTree *)aTree;
+ (nullable NSArray *)levelOrderNodeAndLRnode:(BinaryTree *)aTree;

@end

NS_ASSUME_NONNULL_END
