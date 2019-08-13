//
//  AlgorithmConst.swift
//  MianshiTi
//
//  Created by app-01 on 2019/8/13.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

import Foundation

struct AlgorithmType:OptionSet {
    let rawValue:Int
    
    static let recursive = AlgorithmType(rawValue: 1)
    static let nonRecusive = AlgorithmType(rawValue: 1<<1)
}
