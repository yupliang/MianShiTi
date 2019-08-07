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
    func threadRunLoop() -> Void {
        serialQueue.async {
            print("code add 1")
            RunLoop.current.run()
        }
        serialQueue.async {
            print("code add 2")
        }
    }
}
