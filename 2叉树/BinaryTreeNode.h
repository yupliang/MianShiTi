//
//  BinaryTreeNode.h
//  MianshiTi
//
//  Created by 于培亮 on 2019/4/29.
//  Copyright © 2019 于培亮. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BinaryTreeNode : NSObject

@property (nonatomic,assign) NSInteger data;
@property (nonatomic,strong) BinaryTreeNode *leftNode;
@property (nonatomic,strong) BinaryTreeNode *rightNode;

@end

NS_ASSUME_NONNULL_END
