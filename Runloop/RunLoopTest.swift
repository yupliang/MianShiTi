//
//  RunLoopTest.swift
//  MianshiTi
//
//  Created by app-01 on 2019/8/7.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

import Foundation

class RLTest:NSObject {
    let serialQueue = DispatchQueue(label: "serialQueue")
    let port = NSMachPort()
    var runLoopObserver:CFRunLoopObserver?
    func threadRunLoop() -> Void {
        let controllerPoint = Unmanaged<RLTest>.passUnretained(self).toOpaque()
        var context = CFRunLoopObserverContext(version: 0, info: controllerPoint, retain: nil, release: nil, copyDescription: nil)
        
        runLoopObserver = CFRunLoopObserverCreate(nil, CFRunLoopActivity.allActivities.rawValue, true, 0, { (observer, activity, info) in
//            print("activity is \(activity)")
            if activity == CFRunLoopActivity.beforeWaiting {
                print("before waiting ")
            }
            
        }, &context)
            //CFRunLoopObserverCreate(kCFAllocatorDefault,kCFRunLoopAllActivities,YES,0,&runLoopObserverCallBack,&context);
        
        CFRunLoopAddObserver(CFRunLoopGetCurrent(), runLoopObserver, CFRunLoopMode.commonModes);
        
        serialQueue.async {
            print("code add 1")
            RunLoop.current.add(self.port, forMode: .default)
            RunLoop.current.run()
            print("code never executed")
        }
        serialQueue.async {
            print("code add 2")
        }
    }
    deinit {
        print("\(self) deinit")
    }
    
    
}
