//
//  List.m
//  MianshiTi
//
//  Created by QiQiuZhe on 2019/4/27.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

#import "List.h"

@implementation List

- (void)tailAppend:(NSInteger)value {
    Node *aNode = [Node new];
    aNode.value = value;
    if (self.tail == nil) {
        self.head = aNode;
        self.tail = aNode;
    } else {
        self.tail.next = aNode;
        self.tail = aNode;
    }
}

- (void)logFullList {
    Node *aNode = self.head;
    NSString *result = @"";
    while (aNode != nil) {
        if (result.length == 0) {
            result = [NSString stringWithFormat:@"%ld", (long)aNode.value];
        } else  {
            result = [NSString stringWithFormat:@"%@->%ld", result,(long)aNode.value];
        }
        aNode = aNode.next;
    }
    NSLog(@"list is %@", result);
}

- (void)changeListByValue:(NSInteger)value {
    if (self.head == nil) return;
    Node *dummyLeft = [Node new];
    dummyLeft.value = 0;
    Node *dummyRight = [Node new];
    dummyRight.value = 0;
    
    Node *preNode = dummyLeft;
    Node *postNode = dummyRight;
    
    Node *tempHead = self.head;
    while (tempHead != nil) {
        if (tempHead.value < value) {
            preNode.next = tempHead;
            preNode = tempHead;
        } else {
            postNode.next = tempHead;
            postNode = tempHead;
        }
        tempHead = tempHead.next;
    }
    postNode.next = nil;
    preNode.next = dummyRight.next;
    self.head = dummyLeft.next;
}
@end
