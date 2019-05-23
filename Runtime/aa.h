//
//  aa.h
//  RunloopTest
//
//  Created by yupeiliang on 2019/5/21.
//  Copyright © 2019 Qiqiuzhe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>
{
@public
    NSString *_name;//
    NSString *_xx;
    int _age;
}

@end

@interface Student : Person
{
@public
    int _no;
}
- (void)study;
@end
