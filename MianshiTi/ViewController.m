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
#import "ViewController1.h"
#import "Queue.h"
#import "XView.h"
#import "CView.h"
@import UserNotifications;

@interface ViewController () {
    BinaryTree *_tree;
    CFRunLoopObserverRef runLoopObserver;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    XView *xv = [[XView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    xv.backgroundColor = [UIColor greenColor];
    [self.view addSubview:xv];
    
    CView *cv = [[CView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    cv.backgroundColor = [UIColor redColor];
    [self.view addSubview:cv];
    
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
    _tree = aTree;
    NSLog(@"tree create finished");
    
    NSBlockOperation *aop = [NSBlockOperation blockOperationWithBlock:^{
        [[NSRunLoop currentRunLoop] run];
//        while (true) {
//            NSLog(@"");
//        }
    }];
    NSOperationQueue *aq = [NSOperationQueue new];
    [aq addOperation:aop];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [[NSRunLoop currentRunLoop] run];
//        while (true) {
//            NSLog(@"");
//        }
    });
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
    NSLog(@"首界面viewdidload方法完成");
    
    
    CFRunLoopObserverContext context = {0,(__bridge void*)self,NULL,NULL};
     runLoopObserver = CFRunLoopObserverCreate(kCFAllocatorDefault,kCFRunLoopAllActivities,YES,0,&runLoopObserverCallBack,&context);
    
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), runLoopObserver, kCFRunLoopCommonModes);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[ViewController1 class]]) {
        ViewController1 *vc = segue.destinationViewController;
        vc.datas = [BinaryTree levelOrderNodeAndLRnode:_tree];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"toouches began");
    });
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"toouches began from main queue");
    });
}


void runLoopObserverCallBack (CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info) {
    NSString *runloopActivity = @"";
    switch (activity) {
        case kCFRunLoopEntry:
            runloopActivity = @"entry";
            break;
            case kCFRunLoopBeforeTimers:
            runloopActivity = @"beforetimers";
            break;
            case kCFRunLoopBeforeSources:
            runloopActivity = @"beforesources";
            break;
            case kCFRunLoopBeforeWaiting:
            runloopActivity = @"beforewaiting";
            break;
            case kCFRunLoopAfterWaiting:
            runloopActivity = @"afterwaiting";
            break;
            case kCFRunLoopAllActivities:
            runloopActivity = @"allactivity";
            break;
            case kCFRunLoopExit:
            runloopActivity = @"exit";
            break;
        default:
            break;
    }
    if ([runloopActivity isEqualToString:@"afterwaiting"]) {
        NSLog(@"");
    }
//    NSLog(@"loop %@ activity %@ info %@", CFRunLoopGetCurrent(),runloopActivity, info);
    NSLog(@"activity %@ info %@", runloopActivity, info);
}

- (IBAction)sameReqLocalNoti:(id)sender {
    static NSString *const reqId = @"local.game.score";
    __block int a = 0;
    for (int i=0; i<100; i++) {
        UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
        content.body = [NSString stringWithFormat:@"score: 0:%d",a];
        UNTimeIntervalNotificationTrigger *t = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:1 repeats:NO];
        UNNotificationRequest *req = [UNNotificationRequest requestWithIdentifier:reqId content:content trigger:t];
        [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:req withCompletionHandler:^(NSError * _Nullable error) {
            NSLog(@"add complete error is %@", error);
        }];
        a++;
        sleep(2);
    }
}

@end
