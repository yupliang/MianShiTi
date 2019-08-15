//
//  BTreeProblem.swift
//  MianshiTi
//
//  Created by app-01 on 2019/8/13.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

import Foundation

class BTreeProblem {
    func preorderNonrecursive(tree:BinaryTree) -> String {
        var result = ""
        var stack = ObjectStack()
        stack.push(tree.rootNode)
        print("xx \(stack.peek as Any)")
        print("\(stack.peek is BinaryTreeNode)")
        print("\(stack.peek! is BinaryTreeNode)")
        while stack.isEmpty == false {
            while stack.isEmpty == false {
                if let item = stack.peek as? BinaryTreeNode {
                    if result.count > 0 {
                        result = "\(result)->\(item.data)"
                    } else {
                        result = "\(item.data)"
                    }
                    if item.left != nil {
                        stack.push(item.left)
                    } else {
                        break
                    }
                }
               
            }
            var right = stack.pop()
            while right == nil && stack.isEmpty == false {
                right = stack.pop()
            }
            if right == nil {
                break
            } else {
                stack.push(right!)
            }
        }
        return result
    }
    

}
