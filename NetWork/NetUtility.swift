//
//  NetUtility.swift
//  MianshiTi
//
//  Created by Qiqiuzhe on 2019/7/13.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

import Foundation

class NetUtility {
    func loadData(_ session:URLSession?, searchWord word:String?, callback action:@escaping (()->())) {
        let s = session ?? URLSession.shared
        let request = try? makeRequest(1, searchWord: word)
        let task = s.dataTask(with: request!) { (data, response, error) in
            guard let data = data else { return }
            print("data is \(String(data: data, encoding: .utf8)!)")
            action()
        }
        task.resume()
    }
    func makeRequest(_ v:Int, searchWord word:String?) throws -> URLRequest {
        if v == 0 {
            throw NetUtilityError.requestError
        } else {
            let url = URL(string: "https://www.baidu.com/?q=\(word!)")!
            return URLRequest(url: url)
        }
    }
}

enum NetUtilityError: Error {
    case requestError
}
