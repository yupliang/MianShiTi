//
//  BigData.h
//  MianshiTi
//
//  Created by Qiqiuzhe on 2019/5/20.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BigData : NSObject

- (NSArray *)addData:(NSArray *)data1 AndData2:(NSArray *)data2;
- (NSString *)outPutBigData:(NSArray *)data;

@end

NS_ASSUME_NONNULL_END
