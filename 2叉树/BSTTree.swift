//
//  BSTTree.swift
//  MianshiTi
//
//  Created by Qiqiuzhe on 2019/6/28.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

import Foundation

class BSTTree<Key:Comparable, Value> {
    var size = 0
    var root: BSTNode<Key, Value>?
    
    public func add(key:Key, value:Value) {
        root = add(node: root, key: key, value: value)
    }
    
    public func containes(key:Key) -> Bool {
        if getNode(node: root,key: key) != nil {
            return true
        }
        return false
    }
    public func getSize() -> Int {
        return size
    }
    public func remove(key:Key) -> Value? {
        if let dNode = getNode(node: root, key: key) {
            root = remove(node: root, key: key)
            return dNode.value
        }
        return nil
    }
    private func remove(node: BSTNode<Key,Value>?, key: Key) -> BSTNode<Key,Value>? {
        if let node = node {
            if node.key > key {
                node.left = remove(node: node.left, key: key)
                return node
            } else if node.key < key {
                node.right = remove(node: node.right, key: key)
                return node
            } else {
                if node.left == nil {
                    return node.right
                }
                if node.right == nil {
                    return node.left
                }
                let minMaxNode = getMinValue(node: node.right)!
                minMaxNode.right = removeMin(node: minMaxNode)
                minMaxNode.left = node.left
                return minMaxNode
            }
        }
        return nil
    }
    private func getMinValue(node:BSTNode<Key,Value>?) -> BSTNode<Key,Value>? {
        return nil
    }
    private func removeMin(node:BSTNode<Key,Value>?) -> BSTNode<Key,Value>? {
        return node?.right
    }
    private func getNode(node: BSTNode<Key,Value>?, key:Key) -> BSTNode<Key,Value>? {
        if let node = node {
            if node.key == key {
                return node
            } else if node.key<key {
                return getNode(node: node.right, key: key)
            } else {
                return getNode(node: node.left, key: key)
            }
        }
        return nil
    }
    private func add(node:BSTNode<Key,Value>?, key:Key, value:Value) -> BSTNode<Key,Value>? {
        if let node = node {
            if node.key > key {
                node.left = add(node: node.left, key: key, value: value)
                return node
            } else if node.key < key {
                node.right = add(node: node.right, key: key, value: value)
                return node
            } else {
                node.value = value
                return node
            }
        } else {
            size += 1
            return BSTNode(key: key, value: value)
        }
    }
}
