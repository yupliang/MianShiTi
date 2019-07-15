//
//  TestStackViewController.swift
//  MianshiTi
//
//  Created by yupeiliang on 2019/7/12.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

import UIKit
import UserNotifications

class TestStackViewController: UIViewController {

    @IBOutlet var weatherInfo: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let content = UNMutableNotificationContent()
        content.categoryIdentifier = "handleActions"
        content.body = "记住：吃一顿大餐"
        
        var date = DateComponents()
        date.hour = 8
        date.minute = 30
        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
        
        let request = UNNotificationRequest(identifier: "01", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("add request error:\(error)")
            }
        }
        
        let handleActions: UNNotificationCategory = {
            let doneAction = UNNotificationAction(identifier: "action.done", title: "完成", options: [.foreground])
            let jumpAction = UNNotificationAction(identifier: "action.jump", title: "跳过", options: [.foreground])
            let startTimer = UNNotificationAction(identifier: "action.startTimer", title: "启动定时器", options: [.foreground])
            return UNNotificationCategory(identifier: "handleActions", actions: [doneAction,jumpAction,startTimer], intentIdentifiers: [], options: [.customDismissAction])
        }()
        UNUserNotificationCenter.current().setNotificationCategories([handleActions])
        
    }
    

    @IBAction func act(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.weatherInfo.isHidden = !self.weatherInfo.isHidden;
            if self.weatherInfo.isHidden {
                sender.setTitle("show", for: UIControl.State.normal)
            } else {
                sender.setTitle("Show Hide", for: UIControl.State.normal)
            }
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
