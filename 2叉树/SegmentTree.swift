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
        buildSegment(l:0, r:datas.count-1, curIndex:0)
    }
    
    private func buildSegment(l:Int, r:Int, curIndex:Int) {
        if l == r {
            trees[curIndex] = datas[l]
            return
        }
        let lchidlIndex = leftChildIndex(index: curIndex)
        let rchildIndex = rightChildIndex(index: curIndex)
        let mid = (l+r)/2
        buildSegment(l: l, r: mid, curIndex: lchidlIndex)
        buildSegment(l: mid+1, r: r, curIndex: rchildIndex)
        trees[curIndex] = merger(trees[lchidlIndex], trees[rchildIndex])
    }
    
    func leftChildIndex(index:Int) -> Int {
        return 2*index+1
    }
    
    func rightChildIndex(index:Int) -> Int {
        return 2*index+2
    }
    
    func query(ql:T, qr:T) -> T? {
        return nil
    }
}
