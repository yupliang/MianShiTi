//
//  MaxHeap.swift
//  MianshiTi
//
//  Created by Qiqiuzhe on 2019/6/30.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
// 完全二叉树 ；任意节点的值不大于父节点

import Foundation

class MaxHeap<Key:Comparable> {
    var data:[Key]!
    init() {
        data = Array()
    }
    public func add(k:Key) {
        data.append(k)
        var insertDataIndex = data.count - 1
        var parentIndex = (insertDataIndex - 1)/2
        while data[parentIndex] < data[insertDataIndex] {
            let t = data[insertDataIndex]
            data[insertDataIndex] = data[parentIndex]
            data[parentIndex] = t
            insertDataIndex = parentIndex
            parentIndex = (insertDataIndex - 1) / 2
        }
    }
    public func size() -> Int {
        return data.count
    }
    public func popMax() -> Key? {
        if data.isEmpty {
            return nil
        }
        if data.count == 1 {
            return data.removeLast()
        }
        var t = data[0]
        data[0] = data[data.count-1]
        data[data.count-1] = t
        data.removeLast()
        
        var currentInsertIndex = 0
        var leftChildIndex = 2*currentInsertIndex+1
        var rightChildIndex = 2*currentInsertIndex+2
        while leftChildIndex < size() { //只判断左孩子，这是对堆是k一棵完全二叉树的运用
            if  data[leftChildIndex] > data[currentInsertIndex] {
                t = data[currentInsertIndex]
                data[currentInsertIndex] = data[leftChildIndex]
                data[leftChildIndex] = t
                currentInsertIndex = leftChildIndex
            } else if rightChildIndex < size() && data[rightChildIndex] > data[currentInsertIndex] {
                t = data[currentInsertIndex]
                data[currentInsertIndex] = data[rightChildIndex]
                data[rightChildIndex] = t
                currentInsertIndex = rightChildIndex
            }
            leftChildIndex = 2*currentInsertIndex+1
            rightChildIndex = 2*currentInsertIndex+1
        }
        return t
    }
    public func getMax() -> Key? {
        return data.first
    }
    public func isEmpty() -> Bool {
        return data.isEmpty
    }
}
