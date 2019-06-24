//
//  MinStack.swift
//  MianshiTi
//
//  Created by Qiqiuzhe on 2019/6/13.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

import Foundation

class MinStack {
    
    var mainS:[Int]!
    var minS:[Int]!
    /** initialize your data structure here. */
    init() {
        mainS = Array<Int>()
        minS = Array<Int>()
    }
    
    func push(_ x: Int) {
        mainS.append(x)
        if let l = minS.last {
            if l >= x {
                minS.append(x)
            }
        } else {
            minS.append(x)
        }
    }
    
    func pop() {
        if let main_l = mainS.last {
            if let min_l = minS.last {
                if main_l == min_l {
                    minS.removeLast()
                }
            }
        }
        mainS.removeLast()
    }
    
    func top() -> Int {
        return mainS.last ?? 0
    }
    
    func getMin() -> Int {
        return minS.last ?? 0
    }
}
