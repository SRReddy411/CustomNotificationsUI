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
    
    @IBOutlet var rejectBtn: UIButton!
    @IBOutlet var acceptBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
        acceptBtn.addTarget(self, action: #selector(likeButtonTapped(sender:)), for: .touchUpInside)
        rejectBtn.addTarget(self, action: #selector(rejectButtonTapped(sender:)), for: .touchUpInside)
    }
    
//    func didReceive(_ notification: UNNotification) {
//
//        self.label?.text = notification.request.content.title
        //self.episodeNameLabel.text = notification.request.content.body
        
//        let imgAttachment = notification.request.content.attachments[0]
//        let buttonNormalStateAtt = notification.request.content.attachments[1]
//        let buttonHighlightStateAtt = notification.request.content.attachments[2]
//
//        guard let imageData = NSData(contentsOf: imgAttachment.url), let buttonNormalStateImgData = NSData(contentsOf: buttonNormalStateAtt.url), let buttonHighlightStateImgData = NSData(contentsOf: buttonHighlightStateAtt.url) else { return }
//
//        let image = UIImage(data: imageData as Data)
//        let buttonNormalStateImg = UIImage(data: buttonNormalStateImgData as Data)?.withRenderingMode(.alwaysOriginal)
//        let buttonHighlightStateImg = UIImage(data: buttonHighlightStateImgData as Data)?.withRenderingMode(.alwaysOriginal)
//
//        imageView.image = image
//        likeButton.setImage(buttonNormalStateImg, for: .normal)
//        likeButton.setImage(buttonHighlightStateImg, for: .selected)
    //}
    
    @objc func likeButtonTapped(sender: UIButton) {
        print("accept btn action")
        acceptBtn.backgroundColor = UIColor.red
        rejectBtn.backgroundColor = UIColor.black
    }
    @objc func rejectButtonTapped(sender: UIButton) {
        print("accept btn action")
         acceptBtn.backgroundColor = UIColor.black
        rejectBtn.backgroundColor = UIColor.red
    }
    
    func didReceive(_ notification: UNNotification) {
        self.label?.text = notification.request.content.body
    }
    
    func didReceive(_ response: UNNotificationResponse, completionHandler completion:
        (UNNotificationContentExtensionResponseOption) -> Void) {
          guard let currentActions = extensionContext?.notificationActions else { return }
          if response.actionIdentifier == "play-action" {
        }
          completion(.doNotDismiss)
    }

}
