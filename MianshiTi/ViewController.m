//
//  ViewController.m
//  MianshiTi
//
//  Created by QiQiuZhe on 2019/4/27.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

#import "ViewController.h"
#import "List.h"
#import "BinaryTree.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"now create a list 1->5->3->2->4->2");
    List *aList = [List new];
    [aList tailAppend:1];
    [aList tailAppend:5];
    [aList tailAppend:3];
    [aList tailAppend:2];
    [aList tailAppend:4];
    [aList tailAppend:2];
    [aList logFullList];
    NSLog(@"x=3 now change list to 1->2-2->5->3->4");
    [aList changeListByValue:3];
    [aList logFullList];
    
    NSLog(@"now create a binary tree 8 3 1 max max 6 4 max max 7 max max 10 max 14 13 max max max");//pre order
//    [@[@(8),@(3),@(1),@(NSIntegerMax),@(NSIntegerMax),@(6),@(4),@(NSIntegerMax),@(NSIntegerMax),@(7),@(NSIntegerMax),@(NSIntegerMax),@(10),@(NSIntegerMax),@(14),@(13),@(NSIntegerMax),@(NSIntegerMax),@(NSIntegerMax)] mutableCopy]
    BinaryTree *aTree = [BinaryTree new];
    [aTree createTree:[@[@(8),@(3),@(1),@(NSIntegerMax),@(NSIntegerMax),@(6),@(4),@(NSIntegerMax),@(NSIntegerMax),@(7),@(NSIntegerMax),@(NSIntegerMax),@(10),@(NSIntegerMax),@(14),@(13),@(NSIntegerMax),@(NSIntegerMax),@(NSIntegerMax)] mutableCopy]];
    NSLog(@"tree create finished");
    
    NSLog(@"begin dlr a tree");
    [BinaryTree dlrTree:aTree];
    NSLog(@"end dlr a tree");
    
    NSLog(@"begin ldr a tree");
    [BinaryTree ldrTree:aTree];
    NSLog(@"end ldr a tree");
    
    NSLog(@"begin lrd a tree");
    [BinaryTree lrdTree:aTree];
    NSLog(@"end lrd a tree");
    
    NSLog(@"begin level order a tree");
    [BinaryTree levelTree:aTree];
    NSLog(@"end level order a tree");
}


@end
