//
//  AVLNode.swift
//  MianshiTi
//
//  Created by yupeiliang on 2019/7/4.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

import Foundation

class AVLNode<Key: Comparable, Value> {
    var key:Key!
    var value:Value!
    var left:AVLNode?
    var right:AVLNode?
    
    var height = 1
    
    init(key:Key, value:Value) {
        self.key = key
        self.value = value
    }
}
