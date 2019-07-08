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
    
    //MARK:删除元素
    func remove(key:Key) -> Value? {
        if let dNode = get(key: key) {
            root = remove(node: root, key: key)
            return dNode.value
        }
        return nil
    }
    
    //删除节点为key的节点，返回删除后的根节点
    private func remove(node: AVLNode<Key,Value>?, key:Key) -> AVLNode<Key,Value>? {
        
        if let node = node {
            var retNode:AVLNode<Key,Value>?
            
            if node.key == key {
                /**
                 5
                / \
               4   7
              /     \
             1      10
            */
                //删除的节点无左子树，比如删除7这个节点，只需把7的右子树返回即可
                if node.left == nil {
                    return node.right
                }
                //
                if node.right == nil {
                    return node.left
                }
                //删除节点既有左子树，又有右子树，比如删除5
                let mNode = minNode(node: node.right)!
                mNode.right = remove(node: node.right, key: mNode
                .key)
                mNode.left = node.left
                retNode = mNode
            } else if key < node.key {
                let dNode = remove(node: node.left, key: key)
                node.left = dNode
                retNode = node
            } else if key > node.key {
                let dNode = remove(node: node.right, key: key)
                node.right = dNode
                retNode = node
            }
            if let retNode = retNode {
                retNode.height = 1 + max(getHeight(node: retNode.left), getHeight(node: retNode.right))
                //平衡因子
                let balanceFactor = getBalanceFactor(node: retNode)
                return changeBalance(node: retNode, balanceFactor: balanceFactor)
            }
        }
        
        return nil
    }
    
    private func changeBalance(node:AVLNode<Key,Value>?, balanceFactor: Int) -> AVLNode<Key, Value>? {
        if abs(balanceFactor) < 1 {
            return node
        }
        // LL 添加的节点是左孩子的左孩子
        /**
         10
         /
         8         进行右旋转
         /
         5
         */
        if balanceFactor > 1 && getBalanceFactor(node: node?.left) >= 0{
            return rightRotate(Y: node)
        }
        // LR 添加的节点是左孩子的右孩子，先进行左旋转，然后再右旋转
        /**
         10
         /
         8         进行右旋转
         \
         9
         */
        if balanceFactor > 1 && getBalanceFactor(node: node?.left) < 0 {
            node?.left = leftRotate(Y: node?.left)
            return rightRotate(Y: node)
        }
        // RR 添加节点是右孩子的右孩子
        /**
         10
         \
         20
         \
         21
         */
        if balanceFactor < -1 && getBalanceFactor(node: node?.right) <= 0 {
            return leftRotate(Y: node)
        }
        // RL 添加的节点是右孩子的左孩子，先进性右旋转，然后再左旋转
        /**
         10
         \
         20
         /
         14
         */
        if balanceFactor < -1 && getBalanceFactor(node: node?.right) > 0 {
            node?.right = rightRotate(Y: node?.right)
            return leftRotate(Y: node)
        }
        return node
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
    private func minNode(node:AVLNode<Key,Value>?) -> AVLNode<Key,Value>?{
        if let node = node {
            if node.left != nil {
                return minNode(node: node.left)
            } else {
                return node
            }
        }
        return node
    }
}
