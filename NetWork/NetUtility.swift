//
//  NetUtility.swift
//  MianshiTi
//
//  Created by Qiqiuzhe on 2019/7/13.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

import Foundation

class NetUtility {
    func loadData(searchWord word:String?, callback action:@escaping (()->())) {
        let request = try? makeRequest(1, searchWord: word)
        let task = URLSession.shared.dataTask(with: request!) { (data, response, error) in
            guard let data = data else { return }
            print("data is \(data)")
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
