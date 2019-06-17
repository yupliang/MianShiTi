//
//  MyCircleDeque.swift
//  MianshiTi
//
//  Created by yupeiliang on 2019/6/14.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

import Foundation

class MyCircularDeque {
    
    var data:[Int]!
    var size:Int!
    var head:Int!
    var tail:Int!
    var empty:Bool!
    /** Initialize your data structure here. Set the size of the deque to be k. */
    init(_ k: Int) {
        size = k
        data = Array<Int>()
        head = 0
        tail = 0
        empty = true
        for _ in 0...k-1 {
            data.append(-1)
        }
    }
    
    /** Adds an item at the front of Deque. Return true if the operation is successful. */
    func insertFront(_ value: Int) -> Bool {
        if !isFull() {
            empty = false
            data[(head-1+size)%size] = value
            head = (head-1+size)%size
            return true
        } else {
            return false
        }
    }
    
    /** Adds an item at the rear of Deque. Return true if the operation is successful. */
    func insertLast(_ value: Int) -> Bool {
        if !isFull() {
            data[tail] = value
            tail = (tail+1)%size
            return true
        } else {
            return false
        }
    }
    
    /** Deletes an item from the front of Deque. Return true if the operation is successful. */
    func deleteFront() -> Bool {
        if !isEmpty() {
            data[head] = -1
            head = (head+1)%size
            if (head == tail) {
                empty = true
            }
            return true
        } else {
            return false
        }
    }
    
    /** Deletes an item from the rear of Deque. Return true if the operation is successful. */
    func deleteLast() -> Bool {
        if !isEmpty() {
            data[(tail-1+size)%size] = -1
            tail = (tail-1+size)%size
            if (head == tail) {
                empty = true
            }
            return true
        }
        return false
    }
    
    /** Get the front item from the deque. */
    func getFront() -> Int {
        return data[head]
    }
    
    /** Get the last item from the deque. */
    func getRear() -> Int {
        return data[(tail-1+size)%size]
    }
    
    /** Checks whether the circular deque is empty or not. */
    func isEmpty() -> Bool {
        return empty
    }
    
    /** Checks whether the circular deque is full or not. */
    func isFull() -> Bool {
        return !empty && head == tail
    }
}

/**
 * Your MyCircularDeque object will be instantiated and called as such:
 * let obj = MyCircularDeque(k)
 * let ret_1: Bool = obj.insertFront(value)
 * let ret_2: Bool = obj.insertLast(value)
 * let ret_3: Bool = obj.deleteFront()
 * let ret_4: Bool = obj.deleteLast()
 * let ret_5: Int = obj.getFront()
 * let ret_6: Int = obj.getRear()
 * let ret_7: Bool = obj.isEmpty()
 * let ret_8: Bool = obj.isFull()
 */
