//
//  FibProblem.swift
//  MianshiTi
//
//  Created by app-01 on 2019/8/13.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

import Foundation

class FibProblem {
    func Fib(_ n:Int) -> Int {
        if n<=1 {
            return n
        } else {
            return Fib(n-1) + Fib(n-2)
        }
    }
}
