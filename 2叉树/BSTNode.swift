//
//  BSTNode.swift
//  MianshiTi
//
//  Created by Qiqiuzhe on 2019/6/28.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

import Foundation

class BSTNode<Key:Comparable, Value> : NSObject {
    var key:Key!
    var value:Value!
    
    var left: BSTNode?
    var right: BSTNode?
    
    init(key: Key, value:Value) {
        self.key = key
        self.value = value
    }
}
