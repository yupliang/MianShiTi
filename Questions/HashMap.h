//
//  HashMap.h
//  MianshiTi
//
//  Created by Qiqiuzhe on 2019/6/4.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HashMap : NSObject {
    NSMutableArray *_arr;
}

- (void)put:(int)key andValue:(int)value;
- (int)get:(int)key;
- (void)remove:(int)key;

@end

NS_ASSUME_NONNULL_END
