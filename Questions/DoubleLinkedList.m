//
//  DoubleLinkedList.m
//  MianshiTi
//
//  Created by Qiqiuzhe on 2019/5/24.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

#import "DoubleLinkedList.h"

@implementation DoubleLinkedList

- (void)insertNodeToHead:(DLLNode *)node {
#pragma 处理 node 在 list中的情况
    node.preNode.nextNode = node.nextNode;
    node.nextNode.preNode = node.preNode;
    if (self.tail == node) self.tail = node.preNode;
    
    node.nextNode = self.head;
    self.head.preNode = node;
    self.head = node;
    if (self.tail == nil)self.tail = self.head;
}

- (void)removeLastItem {
    if (self.head == self.tail) {
        self.head = nil;
        self.tail = nil;
    } else {
        self.tail.preNode.nextNode = nil;
        self.tail = self.tail.preNode;
        self.tail.preNode = nil;
    }
}
@end
