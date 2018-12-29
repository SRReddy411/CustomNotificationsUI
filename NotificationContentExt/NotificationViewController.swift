//
//  NotificationViewController.swift
//  NotificationContentExt
//
//  Created by volive solutions on 29/12/18.
//  Copyright © 2018 volive solutions. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet var label: UILabel?
       @IBOutlet var bodyLabel: UILabel?
    @IBOutlet var rejectBtn: UIButton!
    @IBOutlet var acceptBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
        acceptBtn.addTarget(self, action: #selector(likeButtonTapped(sender:)), for: .touchUpInside)
        rejectBtn.addTarget(self, action: #selector(rejectButtonTapped(sender:)), for: .touchUpInside)
        

    }
 
    @objc func likeButtonTapped(sender: UIButton) {
        print("accept btn action")
        acceptBtn.backgroundColor = UIColor.red
        rejectBtn.backgroundColor = UIColor.black
    }
    @objc func rejectButtonTapped(sender: UIButton) {
        print("Reject btn action")
         acceptBtn.backgroundColor = UIColor.black
         rejectBtn.backgroundColor = UIColor.red
        
        let defaults = UserDefaults(suiteName:"group.volive.CustomeNotifications")
        let x = defaults?.string(forKey: "Check")
         self.bodyLabel?.text = x

    }

    func didReceive(_ notification: UNNotification) {
        self.label?.text = notification.request.content.title
        //self.bodyLabel?.text = notification.request.content.body
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void)
    {
        switch response.notification.request.content.categoryIdentifier{
            
        case "podcast":
            break
        default:
            break
        }
    }
 

}

