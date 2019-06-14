//
//  MyCircleDeque.swift
//  MianshiTi
//
//  Created by yupeiliang on 2019/6/14.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

import Foundation

class MyCircularDeque {
    
    /** Initialize your data structure here. Set the size of the deque to be k. */
    init(_ k: Int) {
        
    }
    
    /** Adds an item at the front of Deque. Return true if the operation is successful. */
    func insertFront(_ value: Int) -> Bool {
        return false
    }
    
    /** Adds an item at the rear of Deque. Return true if the operation is successful. */
    func insertLast(_ value: Int) -> Bool {
        return false
    }
    
    /** Deletes an item from the front of Deque. Return true if the operation is successful. */
    func deleteFront() -> Bool {
        return false
    }
    
    /** Deletes an item from the rear of Deque. Return true if the operation is successful. */
    func deleteLast() -> Bool {
        return false
    }
    
    /** Get the front item from the deque. */
    func getFront() -> Int {
        return -1
    }
    
    /** Get the last item from the deque. */
    func getRear() -> Int {
        return -1
    }
    
    /** Checks whether the circular deque is empty or not. */
    func isEmpty() -> Bool {
        return true
    }
    
    /** Checks whether the circular deque is full or not. */
    func isFull() -> Bool {
        return false
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
