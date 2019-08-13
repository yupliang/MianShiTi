//
//  FibProblem.swift
//  MianshiTi
//
//  Created by app-01 on 2019/8/13.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

import Foundation

class FibProblem {
    
    var type:AlgorithmType = .recursive
    
    fileprivate func recursiveFib(_ n: Int) -> Int {
        if n<=1 {
            return n
        } else {
            return Fib(n-1) + Fib(n-2)
        }
    }
    
    fileprivate func nonRecursiveFib(_ n:Int) -> Int {
        if n<=1 {
            return n
        }
        var two = 0
        var one = 1
        var cur:Int = 0
        for _ in 2...n {
            cur = one + two
            two = one
            one = cur
        }
        return cur
    }
    
    func Fib(_ n:Int) -> Int {
        if type == AlgorithmType.recursive {
            return recursiveFib(n)
        } else if type == AlgorithmType.nonRecusive {
            return nonRecursiveFib(n)
        }
        return 0
    }
}

