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
        var last = digits.last!
        var lastIndex = digits.count-1
        if last+1 >= 10 {
            var jinwei = true
            while jinwei {
                jinwei = last+1 >= 10
                r[lastIndex] = (last+1)%10
                if lastIndex == 0 {
                    if jinwei {
                        r.insert(1, at: 0)
                    }
                    break
                }
                last = r[lastIndex-1]
                lastIndex = lastIndex - 1
            }
        } else {
            r[lastIndex] = last+1
        }
        
        return r
    }
    
    //a^b %p = ((a%p)^b) % p
    //(a*b) %p = (a%p * b%p) %p
    
    let mod = 1337
    
    func superPow(_ a: Int, _ b: [Int]) -> Int {
        var sum = 1
        for i in 0 ... b.count-1 {
            var n = Int(pow(Double(10), Double(i))) * b[b.count-1-i]
            var base = a % mod
            var r = 1
            while n > 0 {
                if (n & 1) > 0 {
                    r = (r%mod * base)%mod
                }
                base = (base%mod * base%mod) % mod
                n = n >> 1
            }
            sum = (sum%mod * r)%mod
        }
        return sum
    }
    
    func qpow(x:Int, n:Int) -> Int {
        var r = 1
        var m = n
        var base = x
        while n > 0 {
            if (n & 1) > 0 {
                r = (r%mod * base)%mod
            }
            base = (base%mod * base%mod) % mod
            m = m >> 1
        }
        return r
    }
}
