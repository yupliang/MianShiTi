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
    
    func Fib(_ n:Int) -> Int {
        if type == AlgorithmType.recursive {
            if n<=1 {
                return n
            } else {
                return Fib(n-1) + Fib(n-2)
            }
        } else if type == AlgorithmType.nonRecusive {
            return 0
        }
        return 0
    }
}

