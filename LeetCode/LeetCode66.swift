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
        var ret = 1
        var modNumber = a
        for i in 0 ... b.count-1 {
            ret = (ret * qpow(x: modNumber, n: b[b.count-1-i])) % mod
            modNumber = qpow(x: modNumber%mod, n: 10) % mod
        }
        return ret
    }
    
    func qpow(x:Int, n:Int) -> Int {
        var r = 1
        var m = n
        var base = x%mod
        while m > 0 {
            if (m & 1) > 0 {
                r = (r * base) % mod
            }
            base = (base * base) % mod
            m = m >> 1
        }
        return r
    }
    
    func myPow(_ x: Double, _ n: Int) -> Double {
        var ret = 1.0
        var m = abs(n)
        var base = x
        while m>0 {
            if m&1 > 0 {
                ret = ret*base
            }
            base = base*base
            m = m>>1
        }
        if n < 0 {
            ret = 1/ret
        }
        return ret
    }
}
