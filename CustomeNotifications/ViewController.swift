//
//  ViewController.swift
//  CustomeNotifications
//
//  Created by volive solutions on 29/12/18.
//  Copyright © 2018 volive solutions. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    private var stackView: UIStackView!
    var podcastNotificationButton: UIButton!
    private var podcastName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stackView = UIStackView(frame: view.frame)
        stackView?.distribution = .fillProportionally
        stackView?.alignment = .center
        stackView?.axis = .vertical
        stackView.spacing = 20
        stackView?.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        stackView?.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       
        podcastName = "StartUp"
        
        podcastNotificationButton = UIButton(type: .roundedRect)
        podcastNotificationButton.backgroundColor = UIColor.black
        podcastNotificationButton.setTitleColor(.white, for: .normal)
        podcastNotificationButton.setTitle("Send podcast notification", for: .normal)
        podcastNotificationButton.addTarget(self, action: #selector(sendPodcastNotification(sender:)), for: .touchUpInside)
        
        stackView.addArrangedSubview(podcastNotificationButton)
        let defaults = UserDefaults(suiteName: "group.volive.CustomeNotifications")
        defaults?.set("Rami", forKey: "Check")
   
    }
    @objc func sendPodcastNotification(sender: UIButton) {
        
        guard let podcastName = podcastName else { return }
        
        if #available(iOS 10.0, *) {
            let content = UNMutableNotificationContent()
            content.body = "Introducing Season 7"
            content.title = "New episode of \(podcastName):"
            content.threadIdentifier = podcastName.lowercased()
            if #available(iOS 12.0, *) {
                content.summaryArgument = podcastName
                
            } else {
                // Fallback on earlier versions
            }
            content.categoryIdentifier = NotificationCategoryType.podcast.rawValue

            sendNotification(with: content)
        } else {
            // Fallback on earlier versions
        }

    }
    
    @available(iOS 10.0, *)
    func sendNotification(with content: UNNotificationContent) {
        let uuid = UUID().uuidString
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: uuid, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }

}

