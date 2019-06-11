//
//  CView.m
//  MianshiTi
//
//  Created by yupeiliang on 2019/6/11.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

#import "CView.h"

@implementation CView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"");
    bool flag = [super pointInside:point withEvent:event];
    return false;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *a = [super hitTest:point withEvent:event];
    return nil;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"");
}
@end
