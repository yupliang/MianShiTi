//
//  AppDelegate.m
//  MianshiTi
//
//  Created by QiQiuZhe on 2019/4/27.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//


#import "AppDelegate.h"
@import UserNotifications;



@interface AppDelegate () {
     
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    ABC *b = [ABC new];
//    ABC *a = [ABC new];
//    a.d = b;
//    b.d = a;
    NSLog(@"didfinishlaunching finished");
//    int xx = -1;
//    for (int i=0; i<300; i++) {
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//            [[NSThread currentThread] setName:[NSString stringWithFormat:@"name %d",i]];
//            [[NSRunLoop currentRunLoop] addPort:[NSMachPort port] forMode:NSRunLoopCommonModes];
//            [[NSRunLoop currentRunLoop] run];
//        });
//    }
    [[UNUserNotificationCenter currentNotificationCenter] requestAuthorizationWithOptions:UNAuthorizationOptionAlert|UNAuthorizationOptionBadge|UNAuthorizationOptionSound completionHandler:^(BOOL granted, NSError * _Nullable error) {
        NSLog(@"notification granted %d error %@", granted,error);
    }];
    return YES;
}

- (void)xxx:(id)obj {
    NSLog(@"thread %@ %@", [NSThread currentThread],obj);
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
}

@end
