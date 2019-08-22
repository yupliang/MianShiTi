//
//  TreeNode.swift
//  MianshiTi
//
//  Created by app-01 on 2019/8/22.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

import Foundation

//Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

