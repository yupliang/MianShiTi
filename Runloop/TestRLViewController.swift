//
//  TestRLViewController.swift
//  MianshiTi
//
//  Created by Qiqiuzhe on 2019/8/7.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

import UIKit

class TestRLViewController: UIViewController {
   
    var rl:RLTest!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rl = RLTest()
        rl.threadRunLoop()
        rl = nil
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
