//
//  EqualObject.h
//  MianshiTi
//
//  Created by yupeiliang on 2019/5/28.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EqualObject : NSObject {
    @public
    char *_data;
}

@property (nonatomic,copy) NSString *_name;
@property (nonatomic,strong) NSMutableDictionary *_cache;
@property (nonatomic,assign) int _length;

@end

NS_ASSUME_NONNULL_END
