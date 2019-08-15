//
//  LeetCode66.swift
//  MianshiTi
//
//  Created by app-01 on 2019/8/15.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

import Foundation

class Solution66 {
    func plusOne(_ digits: [Int]) -> [Int] {
        var r = Array(digits)
        let last = digits.last!
        let lastIndex = digits.index(of: last)!
        r[lastIndex] = last+1
        return r
    }
}
