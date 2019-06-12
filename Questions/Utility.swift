//
//  Utility.swift
//  MianshiTi
//
//  Created by Qiqiuzhe on 2019/6/13.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

import Foundation

class Utility {
    func validateIpv6(_ p:String?) -> Bool {
        guard let p_unwraped = p else {
            return false
        }
        do {
            var regex = try NSRegularExpression(pattern: "^([0-9a-fA-F]+:){7}[0-9a-fA-F]+$", options: .caseInsensitive)
            if regex.matches(in: p_unwraped, options: [], range: NSMakeRange(0, p_unwraped.count)).count < 1 {
                return false
            }
            let ss = p_unwraped.split(separator: ":")
            if ss.count != 8 {
                return false
            }
            
            var index = 0
            regex = try NSRegularExpression(pattern: "^[0-9a-fA-F]*$", options: .caseInsensitive)
            for a_s in ss {
                if a_s.count > 4 {
                    return false
                }
                if index == 0 {
                    if a_s.suffix(0).compare("0").rawValue == 0 {
                        return false
                    }
                }
                let mr = regex.matches(in: String(a_s), options: [], range: NSMakeRange(0, String(a_s).count))
                if mr.count < 1 {
                    return false
                }
                index = index+1
            }
            return true
        } catch {
            print("error is \(error)")
        }
        return false
    }
    func validateIpv4(_ p:String?) -> Bool {
        guard let p_unwraped = p else {
            return false
        }
        do {
            var regex = try NSRegularExpression(pattern: "^([0-9]*\\.){3}[0-9]*$", options: .caseInsensitive)
            if regex.matches(in: p_unwraped, options: [], range: NSMakeRange(0, p_unwraped.count)).count < 1 {
                return false
            }

            let ss=p_unwraped.split(separator: ".")
            if ss.count != 4 {
                return false
            }
            regex = try NSRegularExpression(pattern: "^[0-9]*$", options: .caseInsensitive)
            for a_s in ss {
                if a_s.count > 1 && String(a_s)[..<String(a_s).index(String(a_s).startIndex, offsetBy: 1)].compare("0").rawValue == 0 {
                    return false
                }
                if regex.matches(in: String(a_s), options: [], range: NSMakeRange(0, String(a_s).count)).count < 1 {
                    return false
                }
                if let aI = Int(a_s) {
                    if aI > 255 {
                        return false
                    }
                } else {
                    return false
                }
            }
            return true
        } catch {
            print(error)
        }
        return false
    }
}
