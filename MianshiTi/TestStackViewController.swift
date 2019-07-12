//
//  TestStackViewController.swift
//  MianshiTi
//
//  Created by yupeiliang on 2019/7/12.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

import UIKit

class TestStackViewController: UIViewController {

    @IBOutlet var weatherInfo: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func act(_ sender: Any) {
        UIView.animate(withDuration: 0.3) {
            self.weatherInfo.isHidden = !self.weatherInfo.isHidden;
        }
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
