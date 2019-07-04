//
//  AVLTree.swift
//  MianshiTi
//
//  Created by yupeiliang on 2019/7/4.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

import Foundation

class AVLTree<Key:Comparable, Value> {
    var root:AVLNode<Key,Value>?
    var size = 0
    func getSize() -> Int {
        return size
    }
    func isEmpty() -> Bool {
        return size == 0
    }
    
    func isBST() -> Bool {
        if size == 0 {
            return true
        }
        
        var results = Array<Key>()
        inOrder(result: &results, root: root)
        for i in 0..<results.count-1 {
            if results[i] > results[i+1] {
                return false
            }
        }
        return true
    }
    
    func add(key:Key, value:Value) -> Void {
        
    }
    
    private func inOrder(result: inout [Key], root: AVLNode<Key,Value>?) {
        if let aRoot = root {
            inOrder(result: &result, root: root?.left)
            result.append(aRoot.key)
            inOrder(result: &result, root: root?.right)
        }
    }
}
