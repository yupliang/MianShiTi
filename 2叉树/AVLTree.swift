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
        root = add(root: root, key: key, value: value)
    }
    
    func isBalance() -> Bool {
        return false
    }
    
    private func isBalance(root: AVLNode<Key,Value>?) -> Bool {
        return false
    }
    
    private func add(root:AVLNode<Key,Value>?, key:Key,value:Value) -> AVLNode<Key,Value>? {
        if let aRoot = root {
            if key == aRoot.key {
                aRoot.value = value
            }
            return aRoot
        } else {
            let node = AVLNode(key: key, value: value)
            size += 1
            return node
        }
    }
    
    func inOrder(result: inout [Key], root: AVLNode<Key,Value>?) {
        if let aRoot = root {
            inOrder(result: &result, root: root?.left)
            result.append(aRoot.key)
            inOrder(result: &result, root: root?.right)
        }
    }
    
    private func getHeight(node:AVLNode<Key,Value>?) -> Int {
        return node?.height ?? 0
    }
    private func getBalanceFactor(node:AVLNode<Key,Value>?) -> Int {
        return getHeight(node: node?.left) - getHeight(node: node?.right)
    }
}
