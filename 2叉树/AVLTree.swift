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
    
    func isBalance() -> Bool {
        return isBalance(root: root)
    }
    
    private func isBalance(root: AVLNode<Key,Value>?) -> Bool {
        if let root = root {
            if getBalanceFactor(node: root) > 1 {
                return false
            }
        }
        return true
    }
    
    //MARK:添加新的元素
    func add(key:Key, value:Value) -> Void {
        root = add(root: root, key: key, value: value)
    }
    
    private func add(root:AVLNode<Key,Value>?, key:Key,value:Value) -> AVLNode<Key,Value>? {
        if let aRoot = root {
            if key == aRoot.key {
                aRoot.value = value
            } else if key < aRoot.key {
                aRoot.left = add(root: aRoot.left, key: key, value: value)
            } else {
                aRoot.right = add(root: aRoot.right, key: key, value: value)
            }
            aRoot.height = 1 + max(getHeight(node: aRoot.left), getHeight(node: aRoot.right))
            
            let balanceFactor = getBalanceFactor(node: aRoot)
            return changeBalance(node: aRoot, balanceFactor: balanceFactor)
        } else {
            let node = AVLNode(key: key, value: value)
            size += 1
            return node
        }
    }
    
    private func changeBalance(node:AVLNode<Key,Value>?, balanceFactor: Int) -> AVLNode<Key, Value>? {
        if abs(balanceFactor) <= 1 {
            return node
        }
        if balanceFactor > 1 {
            return rightRotate(Y: node)
        }
        if balanceFactor < -1 {
            return leftRotate(Y: node)
        }
        return nil
    }
    
    func get(key:Key) -> AVLNode<Key,Value>? {
        return get(root: root, key: key)
    }
    
    // 左旋转
    // 对节点y进行向左旋转操作，返回旋转后新的根节点x
    //    y                             x
    //  /  \                          /   \
    // T4   x      向左旋转 (y)       y     z
    //     / \   - - - - - - - ->   / \   / \
    //   T3  z                     T1 T2 T3 T4
    //      / \
    //     T2 T1
    private func leftRotate(Y:AVLNode<Key,Value>?) -> AVLNode<Key,Value>? {
        if let Y = Y {
            let x = Y.right
            let T3 = x?.left
            x?.left = Y
            Y.right = T3
            Y.height = max(getHeight(node: Y.left), getHeight(node: Y.right)) + 1
            x?.height = max(getHeight(node: x?.left), getHeight(node: x?.right)) + 1
            return x
        }
        return nil
    }
    
    // 右旋转
    // 对节点y进行向右旋转操作，返回旋转后新的根节点x
    //        y                              x
    //       / \                           /   \
    //      x   T4     向右旋转 (y)        z     y
    //     / \       - - - - - - - ->    / \   / \
    //    z   T3                       T1  T2 T3 T4
    //   / \
    // T1   T2
    private func rightRotate(Y:AVLNode<Key,Value>?) -> AVLNode<Key,Value>? {
        if let Y = Y {
            let x = Y.left
            let t3 = x?.right
            x?.right = Y
            Y.left = t3
            Y.height = max(getHeight(node: Y.left), getHeight(node: Y.right)) + 1
            x?.height = max(getHeight(node: x?.left), getHeight(node: x?.right)) + 1
            return x
        }
        return nil
    }
    
    private func get(root:AVLNode<Key,Value>?, key:Key) -> AVLNode<Key,Value>? {
        if let root = root {
            if root.key == key {
                return root
            } else if root.key < key {
                return get(root: root.right, key: key)
            } else {
                return get(root: root.left, key: key)
            }
        }
        return nil
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
    func getBalanceFactor(node:AVLNode<Key,Value>?) -> Int {
        return getHeight(node: node?.left) - getHeight(node: node?.right)
    }
}
