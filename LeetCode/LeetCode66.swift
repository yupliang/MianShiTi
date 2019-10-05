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
        var arrStr:[String] = []
        var usedNumCount = 0
        helper842(S,answer: &arr,useCount: &usedNumCount, strArr: &arrStr)
        return arr
    }
    func helper842(_ S:String, answer asArr: inout [Int], useCount uc: inout Int, strArr strs: inout [String]) {
        for i in 1...S.count {
            if i+uc > S.count {
                break
            }
            let idx1 = S.index(S.startIndex, offsetBy: i+uc)
            let idx2 = S.index(idx1, offsetBy: -i)
            let str = S[idx2..<idx1]
            if let strValue = Int(String(str)) {
                if i > 1 && strValue > 0 && Int(String(S[idx2..<S.index(idx1, offsetBy: -i+1)])) == 0 {
                    break
                }
                uc = uc+i
                asArr.append(strValue)
                strs.append(String(str))
            } else {
                break
            }
            
            if asArr.count >= 3 {
                if asArr[asArr.count-1] - asArr[asArr.count-2] == asArr[asArr.count-3] {
                    helper842(S, answer: &asArr, useCount: &uc, strArr: &strs)
                    if uc == S.count {
                        break
                    } else {
                        asArr.removeLast()
                        uc = uc - numBits(strs.removeLast())
                    }
                } else if asArr[asArr.count-1] - asArr[asArr.count-2] > asArr[asArr.count-3]  {
                    asArr.removeLast()
                    uc = uc - numBits(strs.removeLast())
                    break
                } else {
                    asArr.removeLast()
                    uc = uc - numBits(strs.removeLast())
                }
            } else {
                helper842(S, answer: &asArr, useCount: &uc, strArr: &strs)
                if uc == S.count {
                    if (asArr.count < 3) {
                        asArr.removeLast()
                        uc = uc - numBits(strs.removeLast())
                    }
                    break
                } else {
                    asArr.removeLast()
                    uc = uc - numBits(strs.removeLast())
                }
            }
        }
    }
    private func numBits(_ num:String) -> Int {
        
        return num.count
    }
    func widthOfBinaryTree662_noIndex(_ root: TreeNode?) -> Int {
        var result = 0
        if root != nil {
            var curLevelNodes:[TreeNode?] = []
            curLevelNodes.append(root)
            var leftIndex = 0
            var rightIndex = 0
            while true {
                leftIndex = -1
                rightIndex = -1
                for i in 0...curLevelNodes.count-1 {
                    if curLevelNodes[i] != nil {
                        leftIndex = i
                        break
                    }
                }
                for i in 0...curLevelNodes.count-1 {
                    if curLevelNodes[curLevelNodes.count-1-i] != nil {
                        rightIndex = curLevelNodes.count-1-i
                        break
                    }
                }
                if leftIndex == rightIndex && leftIndex == -1 {
                    break
                }
                var cur:[TreeNode?] = []
                result = max(result, rightIndex-leftIndex+1)
                for i in leftIndex...rightIndex {
                    let item = curLevelNodes[i]
                    cur.append(item?.left)
                    cur.append(item?.right)
                }
                curLevelNodes = cur
            }
        }
        return result
    }
    func widthOfBinaryTree662(_ root: TreeNode?) -> Int {
        var result = 0
        var nodes:[TreeNode?] = []
        var nodeLevelIndex:[Int] = []
        var nodeIndexes:[Int] = []
        var curLevelIndex:[Int] = []
        var alllevels:[Int] = []
        
        if let r = root {
            nodes.append(r)
            nodeIndexes.append(0)
            nodeLevelIndex.append(0)
            curLevelIndex.append(1)
            alllevels.append(1)
            while nodes.count > 0 {
                let topnode = nodes.removeFirst()
                let topnodeIndex = nodeLevelIndex.removeFirst()
                let l = curLevelIndex.removeFirst()
                
                if let ln = topnode?.left {
                    nodes.append(ln)
                    nodeLevelIndex.append(2*topnodeIndex+1)
                    nodeIndexes.append(2*topnodeIndex+1)
                    
                    curLevelIndex.append(l+1)
                    alllevels.append(l+1)
                }
                if let rn = topnode?.right {
                    nodes.append(rn)
                    nodeLevelIndex.append(2*topnodeIndex+2)
                    nodeIndexes.append(2*topnodeIndex+2)
                    
                    curLevelIndex.append(l+1)
                    alllevels.append(l+1)
                }
            }
        }
        
        
        var levelFirstHasValue = false
        var levelFirst = 0
        var levelSecond = 0
        var idx = 0
        var level = 1
        for i in alllevels {
            if levelFirstHasValue == false {
                levelFirstHasValue = true
                level = i
                levelFirst = nodeIndexes[idx]
                levelSecond = nodeIndexes[idx]
            } else {
                if i == level {
                    levelSecond = nodeIndexes[idx]
                } else {
                    level = i
                    levelFirst = nodeIndexes[idx]
                    levelSecond = nodeIndexes[idx]
                }
                result = max(result, levelSecond - levelFirst + 1)
            }
            
            idx = idx+1
        }
        return result
    }
    private func nodeNum(_ level:Int) -> Int {
        let f = pow(2.0, Double(level-1))
        return Int(f)
    }
    
    public func createTree(_ num: inout [Int]) -> TreeNode? {
        var nodes:[TreeNode] = []
        var rootNode:TreeNode?
        var emptyTree = true
        while num.count > 0 {
            if nodes.count == 0 {
                if emptyTree == false {
                    break
                }
                emptyTree = false
                let node = TreeNode(num.removeFirst())
                rootNode = node
                nodes.append(node)
            } else {
                let topNode = nodes.removeFirst()
                if num.isEmpty {
                    break
                }
                var f = num.removeFirst()
                
                if f >= 0 {
                    topNode.left = TreeNode(f)
                    nodes.append(topNode.left!)
                }
                if num.isEmpty {
                    break
                }
                f = num.removeFirst()
                if f >= 0 {
                    topNode.right = TreeNode(f)
                    nodes.append(topNode.right!)
                }
            }
        }
        return rootNode
    }
    func findMaxForm474(_ strs: [String], _ m: Int, _ n: Int) -> Int {
        var arr:[(Int,Int)] = []
        var arrMemory:[String:Int] = [:]
        for item in strs {
            arr.append(helper474(item))
        }
        
        let maxValue = h474(arr, 0, m, n,&arrMemory)
        return maxValue
    }
    
    /*
     从index开始选出 满足 m和n的最大个数
     */
    func h474(_ arr:[(Int,Int)], _ index:Int, _ m:Int, _ n:Int, _ arrMemory:inout [String:Int]) -> Int {
        var r = 0
        let key = "\(index)_\(m)_\(n)"
        if arrMemory[key] != nil {
            r = arrMemory[key]!
            return r
        }
        if index == arr.count {//没有元素
            r = 0
        } else {
            let item = arr[index]
            if m < item.0 || n < item.1 {
                r = h474(arr, index+1, m, n,&arrMemory)
            } else {
                r = max(h474(arr, index+1, m, n,&arrMemory), h474(arr, index+1, m-item.0, n-item.1,&arrMemory)+1)
            }
        }
        arrMemory[key] = r
        return r
    }
    func helper474(_ str:String) -> (Int,Int) {
        var m = 0
        var n = 0
        for item in str {
            if item == "0" {
                m = m+1
            }
            if item == "1" {
                n = n+1
            }
        }
        return (m,n)
    }
    
    var calendars:[(Int,Int)] = []
    func book729(_ start: Int, _ end: Int) -> Bool {
        for item in calendars {
            if start >= item.0 && start < item.1 {
                return false
            }
            if end > item.0 && end < item.1 {
                return false
            }
            if start < item.0 && end >= item.1 {
                return false
            }
        }
        calendars.append((start,end))
        return true
    }
    func canPartition416(_ nums: [Int]) -> Bool {
        var sum:Int = 0
        for item in nums {
            sum = sum+item
        }
        var arrMemory:[String:Bool] = [:]
        return helper416(0, sum, 0, nums, &arrMemory)
    }
    /*
     从下标index开始 找出sum与subSum相等
     */
    func helper416(_ index:Int,_ sum:Int, _ subSum:Int, _ nums:[Int], _ arrMemory:inout [String:Bool]) -> Bool {
        let key = "\(index)\(sum)\(subSum)"
        if arrMemory[key] != nil {
            return arrMemory[key]!
        }
        var r = false
        if index == nums.count || subSum > sum {//没有元素了
            r = false
        } else {
            if nums[index]+subSum == sum-nums[index] {//找到等和子集
                r = true
            } else {
                r = helper416(index+1, sum-nums[index], subSum+nums[index], nums,&arrMemory)//把当前元素插入到子集
                if r == false {
                    r = helper416(index+1, sum, subSum, nums,&arrMemory)
                }
            }
        }
        arrMemory[key] = r
        return r
    }

    var index315:[Int]!
    func countSmaller315(_ nums: [Int]) -> [Int] {
        if nums.count == 0 {
            return []
        }
        index315 = Array<Int>(repeating: 0, count: nums.count)
        var x: [(Int,Int)] = Array<(Int,Int)>(repeating: (0,0), count: nums.count)
        for i in 0...nums.count-1 {
            x[i] = (i,nums[i])
        }
        var tempArr = Array<(Int,Int)>(repeating: (0,0), count: x.count)
        sortSplit315(&x, 0, nums.count-1, &tempArr)
        return index315
    }
    
    func sortSplit315(_ nums: inout [(Int,Int)], _ begin:Int,_ end:Int, _ temp:inout [(Int,Int)]) {
        if begin < end {
            let middle = (begin + end) >> 1
            sortSplit315(&nums, begin, middle, &temp)
            sortSplit315(&nums, middle+1, end, &temp)
            mergeArr315(&nums, begin, middle, end, &temp)
        }
    }
    func mergeArr315(_ nums: inout [(Int,Int)], _ begin:Int, _ middle:Int, _ end:Int, _ tem:inout [(Int,Int)]) {
//        print("merge [\(begin),\(middle)]--[\(middle+1),\(end)]")
        var leftIndex = begin
        var rightIndex = middle+1
        var temIndex:Int = 0
        while leftIndex <= middle && rightIndex<=end {
            if nums[leftIndex].1 <= nums[rightIndex].1 {
                index315[nums[leftIndex].0] += rightIndex-middle-1
                tem[temIndex] = nums[leftIndex]
                temIndex += 1
                leftIndex = leftIndex+1
            } else {
//                for i in leftIndex...middle {
//                    index315[nums[i].0] += 1
//                }
                tem[temIndex] = nums[rightIndex]
                temIndex += 1
                rightIndex += 1
            }
        }
        while leftIndex <= middle {
            index315[nums[leftIndex].0] += rightIndex-middle-1
            tem[temIndex] = nums[leftIndex]
            temIndex += 1
            leftIndex += 1
        }
        while rightIndex <= end {
            tem[temIndex] = nums[rightIndex]
            temIndex += 1
            rightIndex += 1
        }
        
        for i in 0...end-begin {
            nums[begin+i] = tem[i]
        }
    }
    
    
    var count493 = 0
    func reversePairs493(_ nums: [Int]) -> Int {
        count493 = 0
        var x = Array(nums)
        var tempArr = Array<Int>(repeating: 0, count: x.count)
        sortSplit493(&x, 0, nums.count-1, &tempArr)
//        print("nums \(nums) x \(x)")
        return count493
    }
    func sortSplit493(_ nums: inout [Int], _ begin:Int,_ end:Int, _ temp:inout [Int]) {
        if begin < end {
            let middle = (begin + end) >> 1
//            print("left \(begin)-\(middle)")
            sortSplit493(&nums, begin, middle, &temp)
//            print("right \(middle+1)-\(end)")
            sortSplit493(&nums, middle+1, end, &temp)
            mergeArr493(&nums, begin, middle, end, &temp)
        }
    }
    func mergeArr493(_ nums: inout [Int], _ begin:Int, _ middle:Int, _ end:Int, _ tem:inout [Int]) {
//        print("merge [\(begin),\(middle)]--[\(middle+1),\(end)]")
        var leftIndex = begin
        var rightIndex = middle+1
//        var tem:[Int] = Array<Int>(repeating: 0, count: end-begin+1)
        var temIndex:Int = 0
        while leftIndex <= middle && rightIndex<=end {
            if nums[leftIndex] < nums[rightIndex] {
//                tem.append(nums[leftIndex])
                tem[temIndex] = nums[leftIndex]
                temIndex += 1
                leftIndex = leftIndex+1
            } else {
//                tem.append(nums[rightIndex])
                tem[temIndex] = nums[rightIndex]
                temIndex += 1
                rightIndex += 1
                for x in leftIndex...middle {
                    if nums[x] > nums[rightIndex-1] * 2 {
                        count493 += middle-x+1
                        break
                    }
                }
            }
        }
        while leftIndex <= middle {
//            tem.append(nums[leftIndex])
            tem[temIndex] = nums[leftIndex]
            temIndex += 1
            leftIndex += 1
        }
        while rightIndex <= end {
//            tem.append(nums[rightIndex])
            tem[temIndex] = nums[rightIndex]
            temIndex += 1
            rightIndex += 1
        }
        
        for i in 0...end-begin {
            nums[begin+i] = tem[i]
        }
    }
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        if dividend == Int32.min && divisor == 1 {
            return Int(Int32.min)
        }
        var r:Int32 = 0
        var aDividend = -abs(dividend)
        let aDivisor = -abs(divisor)
        var moveStep = 0
        while aDividend <= aDivisor<<moveStep {
            if r == Int32.max {
                break
            }
            aDividend -= aDivisor<<moveStep
            if Int32.max - r < 1<<moveStep {
                r = Int32.max
                break
            } else {
                r += 1<<moveStep
            }
            moveStep += 1
            if aDividend > aDivisor<<moveStep {
                moveStep = 0
            }
        }
        if (dividend > 0 && divisor < 0 || dividend < 0 && divisor > 0) {
            return Int(-r)
        } else {
            return Int(r)
        }
    }
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let m = matrix.count
        if m == 0 {
            return false
        }
        let n = matrix[0].count
        if n == 0 {
            return false
        }
        var begin = 0
        var end = m*n-1
        var middle = (begin+end)>>1
        var row = 0
        var column = 0
        helper74(middle, m, n, &row, &column)
        var value = matrix[row][column]
        var flag = value != target
        if !flag {
            return true
        }
        while flag {
            if value > target {
                end = middle
            } else {
                if begin == middle {
                    begin = end
                } else {
                    begin = middle
                }
            }
            middle = (begin+end)>>1
            helper74(middle, m, n, &row, &column)
            value = matrix[row][column]
            flag = value != target
            if !flag {
                return true
            }
            if begin == end {
                break
            }
        }
        return false
    }
    func helper74(_ value:Int, _ m:Int, _ n:Int, _ row:inout Int, _ column:inout Int) {
        row = value/n
        column = (value+1)%n == 0 ? n-1 : (value+1)%n-1
    }
    func search(_ nums: [Int], _ target: Int) -> Bool {
        if nums.count == 0 {
            return false
        }
        if nums.count == 1 {
            return nums[0] == target
        }
        var media = 0
        for i in 1...nums.count-1 {
            if nums[i] < nums[i-1] {
                media = i
            }
        }
        var arr:[Int] = Array<Int>(repeating: 0, count: nums.count)
        for i in 0...nums.count-1 {
            if i < media {
                arr[i + nums.count - media] = nums[i]
            } else {
                arr[i-media] = nums[i]
            }
        }
        
        var begin = 0
        var end = arr.count - 1
        var middle = (begin+end)>>1
        if arr[middle] != target {
            while begin != end {
                if arr[middle] > target {
                    if middle == end {
                        end = begin
                    } else {
                        end = middle
                    }
                } else {
                    if begin == middle {
                        begin = end
                    } else {
                        begin = middle
                    }
                }
                middle = (begin+end)>>1
                if arr[middle] == target {
                    return true
                }
            }
        } else {
            return true
        }
        
        return false
    }
    func findPeakElement(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return 0
        }
        var result = 0
        for i in 0...nums.count-1 {
            if i == 0 {
                let second = nums[i]
                let third = nums[i+1]
                if second > third {
                    result = i
                    break
                }
            } else if i == nums.count-1 {
                let first = nums[i-1]
                let second = nums[i]
                if second > first {
                    result = i
                    break
                }
            } else {
                let first = nums[i-1]
                let second = nums[i]
                let third = nums[i+1]
                if second > first && second > third {
                    result = i
                    break
                }
            }
        }
        return result
    }
    var dicCalculateMinimumHP:[String:Int] = [:]
    func calculateMinimumHP(_ dungeon: [[Int]]) -> Int {
        dicCalculateMinimumHP.removeAll()
        let rowLen = dungeon.count
        let colLen = dungeon[0].count
        return helper174(0,0,rowLen,colLen,dungeon) + 1
    }
    /*
     帮助函数的用途：计算[rowIndex, colIndex]格子中救出公主所需要的最小生命值
     */
    func helper174(_ rowIndex:Int, _ colIndex:Int, _ rowSize:Int, _ colSize:Int, _ dungeon:[[Int]]) -> Int {
        let key = "\(rowIndex)_\(colIndex)"
        if dicCalculateMinimumHP[key] != nil {
            
            return dicCalculateMinimumHP[key]!
        }
        if rowIndex == rowSize - 1 && colIndex == colSize - 1 {//代表最后一个格子
            if dungeon[rowIndex][colIndex] >= 0 {
                dicCalculateMinimumHP[key] = 0
                return 0
            } else {
                dicCalculateMinimumHP[key] = -dungeon[rowIndex][colIndex]
                return -dungeon[rowIndex][colIndex]
            }
        } else if rowIndex < rowSize && colIndex < colSize {
            let rightMin = helper174(rowIndex, colIndex+1, rowSize, colSize, dungeon)
            let downMin = helper174(rowIndex+1, colIndex, rowSize, colSize, dungeon)
            var r = 0
            r = -dungeon[rowIndex][colIndex] + min(rightMin, downMin)
                
            if r < 0 {
                r = 0
            }
            
            dicCalculateMinimumHP[key] = r
            return r
        }
        dicCalculateMinimumHP[key] = Int(INT64_MAX)
        return Int(INT64_MAX)
    }
    func findDuplicate(_ nums: [Int]) -> Int {
        var tortoise = nums[0]
        var hare = nums[0]
        repeat {
            tortoise = nums[tortoise]
            hare = nums[nums[hare]]
        } while(tortoise != hare)
        
        hare = nums[0]
        while hare != tortoise {
            hare = nums[hare]
            tortoise = nums[tortoise]
        }
        return tortoise
    }
    func maxSubArray(_ nums: [Int]) -> Int {
        var sum = 0
        var ans = nums[0]
        for num in nums {
            if sum >= 0 {
                sum += num
            } else {
                sum = num
            }
            ans = max(sum, ans)
        }
        return ans
    }
    func maxSubArrayDivideAndConquerEdition(_ nums: [Int]) -> Int {//分治思想
        var subBegin = 0
        var subEnd = 0
        return maxSubArrayDivideAndConquerEditionHelper(nums, 0, nums.count-1, &subBegin,&subEnd)
    }
    func maxSubArrayDivideAndConquerEditionHelper(_ nums:[Int],_ begin:Int, _ end:Int,_ subBegin:inout Int, _ subEnd:inout Int) -> Int {
        if begin == end {
            subBegin = begin
            subEnd = begin
            return nums[begin]
        }
        let middle = (begin + end)/2
        if middle == begin || middle == end {
            if nums[begin] > nums[end] {
                if nums[begin] + nums[end] > nums[begin]{
                    subBegin = begin
                    subEnd = end
                    return nums[begin]+nums[end]
                } else {
                    subBegin = begin
                    subEnd = begin
                    return nums[begin]
                }
            } else {
                if nums[begin] + nums[end] > nums[end]{
                    subBegin = begin
                    subEnd = end
                    return nums[begin]+nums[end]
                } else {
                    subBegin = end
                    subEnd = end
                    return nums[end]
                }
            }
        }
        let leftPart = maxSubArrayDivideAndConquerEditionHelper(nums, begin, middle, &subBegin, &subEnd)
        let leftSubBegin = subBegin
        let leftSubEnd = subEnd
        let rightPart = maxSubArrayDivideAndConquerEditionHelper(nums, middle+1, end, &subBegin,&subEnd)
        let rightSubBegin = subBegin
        let rightSubEnd = subEnd
        //尝试将两部分结合,既然是两部分结合，所以必须包含左半部分的最后一个；有半部分的第一个
        var sumCrossTwoParts = 0, crossLeftBegin = 0,crossRightEnd = 0
        var leftDo = false, rightDo = false
        var thisLeftEndSum = 0, maxleft = 0
        for i in 0...middle-begin {
            thisLeftEndSum += nums[middle-i]
            if thisLeftEndSum > maxleft {
                leftDo = true
                crossLeftBegin = middle-i
                maxleft = thisLeftEndSum
            }
        }
        sumCrossTwoParts += maxleft
        
        var thisRightFrontSum = 0, maxright = 0
        for i in middle+1...end {
            thisRightFrontSum += nums[i]
            if thisRightFrontSum > maxright {
                rightDo = true
                crossRightEnd = i
                maxright = thisRightFrontSum
            }
        }
        sumCrossTwoParts += maxright
        
        
        if leftPart > rightPart {
            if leftDo && rightDo && sumCrossTwoParts > leftPart {
                subBegin = crossLeftBegin
                subEnd = crossRightEnd
                return sumCrossTwoParts
            } else {
                subBegin = leftSubBegin
                subEnd = leftSubEnd
                return leftPart
            }
            
        } else {
            if leftDo && rightDo && sumCrossTwoParts > rightPart {
                subBegin = crossLeftBegin
                subEnd = crossRightEnd
                return sumCrossTwoParts
            } else {
                subBegin = rightSubBegin
                subEnd = rightSubEnd
                return rightPart
            }
        }
    }
}
