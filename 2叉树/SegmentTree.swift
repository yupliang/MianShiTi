//
//  SegmentTree.swift
//  MianshiTi
//
//  Created by app-01 on 2019/7/25.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

import Foundation

class SegmentTree<T> {
    var datas:[T]!
    var trees:[T]!
    var merger: (_ a:T, _ b:T) -> T
    
    init(datas:[T], defaultValue:T, merger: @escaping (_ a:T, _ b:T) -> T) {
        self.merger = merger
        self.datas = datas
        //trees 初始化，大小为源数据的4倍
        trees = Array(repeating: defaultValue, count: datas.count * 4)
        
    }
}
