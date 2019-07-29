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
    
    func query(ql:Int, qr:Int) -> T? {
        if ql < 0 || qr >= datas.count || ql > qr || qr < 0{
            return nil
        }
        return query(tIndex:0,l:0,r:datas.count-1,ql:ql,qr:qr)
    }
    private func query(tIndex:Int,l:Int,r:Int,ql:Int,qr:Int) ->T? {
        if l == ql && r == qr {
            return trees[tIndex]
        }
        
        let mid = (l+r)/2
        let lchildIndex = leftChildIndex(index: tIndex)
        let rchildIndex = rightChildIndex(index: tIndex)
        if qr <= mid {
            return query(tIndex: lchildIndex, l: l, r: mid, ql: ql, qr: qr)
        }
        if ql > mid {
            return query(tIndex: rchildIndex, l: mid+1, r: r, ql: ql, qr: qr)
        }
        
        //既在left又在right, 分开查left 和right,查到结构后merger
        let lresult = query(tIndex: lchildIndex, l: l, r: mid, ql: ql, qr: mid)
        let rresult = query(tIndex: rchildIndex, l: mid+1, r: r, ql: mid+1, qr: qr)
        if let lresult = lresult {
            if let rresult = rresult {
                return merger(lresult,rresult)
            }
        }
        return nil
    }
    
    func set(index:Int, value:T) -> Void {
        if index < 0 || index >= datas.count {
            return
        }
        datas[index] = value
        set(index: index, value: value, tIndex:0,l:0,r:datas.count)
    }
    
    private func set(index:Int, value:T, tIndex:Int, l:Int, r:Int) {
        if l == r {
            trees[tIndex] = value
            return
        }
        let mid = (l+r)/2
        let lchildIndex = leftChildIndex(index: tIndex)
        let rchildIndex = rightChildIndex(index: tIndex)
        
        if index<=mid {
            set(index: index, value: value, tIndex: lchildIndex, l: l, r: mid)
        } else {
            set(index: index, value: value, tIndex: rchildIndex, l: mid+1, r: r)
        }
        trees[tIndex] = merger(trees[lchildIndex], trees[rchildIndex])
    }
}
