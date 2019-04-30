//
//  Node.h
//  MianshiTi
//
//  Created by 于培亮 on 2019/4/27.
//  Copyright © 2019 于培亮. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Node : NSObject

@property(nonatomic,strong) Node *next;
@property(nonatomic,assign) NSInteger value;

@end

NS_ASSUME_NONNULL_END
