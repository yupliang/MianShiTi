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

    func findSubsequences491(_ nums: [Int]) -> [[Int]] {
        if nums.count == 0 {
            return []
        }
        
        var r:[[Int]] = []
        var dic:[[Int]:Int] = [:]
        for i in 0 ... (1<<nums.count) - 1 {
            var newObj:[Int] = []
            for j in 0...nums.count-1 {
                if (i & 1<<j) == (1<<j) {
                    if newObj.count == 0 {
                        newObj.append(nums[j])
                    } else if nums[j] >= newObj.last! {
                        newObj.append(nums[j])
                    }
                }
            }
            if newObj.count >= 2 && dic[newObj] == nil {
                r.append(newObj)
                dic[newObj] = 1
            }
        }
        
        return r
    }
    
    var arr:[Int] = []
    func preorderTraversal144(_ root: TreeNode?) -> [Int] {
        helper144(root)
        return arr
    }
    func helper144(_ root:TreeNode?) {
        if let t = root {
            arr.append(t.val)
            helper144(root?.left)
            helper144(root?.right)
        }
    }
    func helper144_2(_ root:TreeNode?) {
        if let t = root {
            var nodes:[TreeNode] = []
            nodes.append(t)
            while nodes.count > 0 {
                let node = nodes.removeLast()
                arr.append(node.val)
                if let nr = node.right {
                    nodes.append(nr)
                }
                if let nl = node.left {
                    nodes.append(nl)
                }
            }
        }
    }
    func splitIntoFibonacci842(_ S: String) -> [Int] {
        var arr:[Int] = []
        var usedNumCount = 0
        helper842(S,answer: &arr,useCount: &usedNumCount)
        return arr
    }
    func helper842(_ S:String, answer asArr: inout [Int], useCount uc: inout Int) {
        for i in 1...S.count {
            if i+uc > S.count {
                break
            }
            let idx1 = S.index(S.startIndex, offsetBy: i+uc)
            let idx2 = S.index(idx1, offsetBy: -i)
            let str = S[idx2..<idx1]
            uc = uc+i
            asArr.append(Int(String(str))!)
            if asArr.count >= 3 {
                if asArr[asArr.count-1] == asArr[asArr.count-2] + asArr[asArr.count-3] {
                    helper842(S, answer: &asArr, useCount: &uc)
                    if uc == S.count {
                        break
                    } else {
                        uc = uc - numBits(asArr.removeLast())
                    }
                } else if asArr[asArr.count-1] > asArr[asArr.count-2] + asArr[asArr.count-3]  {
                    //移除两个数
                    uc = uc - numBits(asArr.removeLast())
                    break
                } else {
                    if 1 + uc > S.count {
                        //移除两个数
                        uc = uc - numBits(asArr.removeLast())
                        break
                    } else {
                        uc = uc - numBits(asArr.removeLast())
                    }
                }
            } else {
                helper842(S, answer: &asArr, useCount: &uc)
                if uc == S.count {
                    if (asArr.count < 3) {
                        uc = uc - numBits(asArr.removeLast())
                    }
                    break
                } else {
                    uc = uc - numBits(asArr.removeLast())
                }
            }
        }
    }
    private func numBits(_ num:Int) -> Int {
        var n = 0
        var x = num
        if x == 0 {
            n = 1
        } else {
            while x != 0 {
                x = x/10
                n = n+1
            }
        }
        
        return n
    }
}
