//
//  BigData.m
//  MianshiTi
//
//  Created by Qiqiuzhe on 2019/5/20.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

#import "BigData.h"

@implementation BigData

- (NSArray *)addData:(NSArray *)data1 AndData2:(NSArray *)data2 {
    NSMutableArray *result = [NSMutableArray new];
    unsigned long minLength = MIN(data1.count, data2.count);
    int overValue = 0;
    for (int i=0; i<minLength; i++) {
        int a = [data1[data1.count-1-i] intValue]+[data2[data2.count-1-i] intValue]+overValue;
        overValue = a/10000;
        [result insertObject:@(a-overValue*10000) atIndex:0];
    }
    NSArray *maxLength = data1.count > data2.count ? data1:data2;
    if (maxLength.count > minLength) {
        for (int i=(unsigned int)minLength; i<maxLength.count; i++) {
            int a=overValue+[maxLength[maxLength.count-1-i] intValue];
            overValue = a/10000;
            [result insertObject:@(a-overValue*10000) atIndex:0];
        }
    }
    if (overValue>0) {
        [result insertObject:@(overValue) atIndex:0];
    }
    
    return result;
}

- (NSString *)outPutBigData:(NSArray *)data {
    NSMutableString *result = [NSMutableString stringWithCapacity:10];
    NSString *temp = nil;
    for (int i=0;i<data.count;i++) {
        if (i>0) {
            if (data[i] == 0) {
                temp = @"0000";
            } else if ([data[i] intValue] < 10) {
                temp = @"000";
            } else if ([data[i] intValue] < 100) {
                temp = @"00";
            } else if ([data[i] intValue]<1000) {
                temp = @"0";
            } else {
                temp = @"";
            }
        } else {
            temp = @"";
        }
        [result appendString:[NSString stringWithFormat:@"%@%@", temp,data[i]]];
    }
    return result;
}

@end
