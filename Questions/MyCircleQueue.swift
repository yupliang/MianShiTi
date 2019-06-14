//
//  MyCircleQueue.swift
//  MianshiTi
//
//  Created by yupeiliang on 2019/6/14.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

import Foundation


class MyCircularQueue {
    
    var data:[Int]!
    var size:Int!
    var empty:Bool!
    var head:Int!
    var tail:Int!
    /** Initialize your data structure here. Set the size of the queue to be k. */
    init(_ k: Int) {
        empty = true
        size = k
        data = Array<Int>()
        for _ in 0...k {
            data.append(-1)
        }
        head = 0
        tail = 0
    }
    
    /** Insert an element into the circular queue. Return true if the operation is successful. */
    func enQueue(_ value: Int) -> Bool {
        if !isFull() {
            data[tail] = value
            tail = (tail+1)%size
            empty = false
            return true
        } else {
            return false
        }
    }
    
    /** Delete an element from the circular queue. Return true if the operation is successful. */
    func deQueue() -> Bool {
        if !isEmpty() {
            data[head] = -1
            head = (head+1)%size
            if head == tail {
                empty = true
            }
            return true
        } else {
            return false
        }
    }
    
    /** Get the front item from the queue. */
    func Front() -> Int {
        if !isEmpty() {
            return data[head]
        } else {
            return -1
        }
    }
    
    /** Get the last item from the queue. */
    func Rear() -> Int {
        if !isEmpty() {
            return data[(tail+size-1)%size]
        } else {
            return -1
        }
    }
    
    /** Checks whether the circular queue is empty or not. */
    func isEmpty() -> Bool {
        return empty
    }
    
    /** Checks whether the circular queue is full or not. */
    func isFull() -> Bool {
        return head == tail && isEmpty() == false
    }
}

/**
 * Your MyCircularQueue object will be instantiated and called as such:
 * let obj = MyCircularQueue(k)
 * let ret_1: Bool = obj.enQueue(value)
 * let ret_2: Bool = obj.deQueue()
 * let ret_3: Int = obj.Front()
 * let ret_4: Int = obj.Rear()
 * let ret_5: Bool = obj.isEmpty()
 * let ret_6: Bool = obj.isFull()
 */
