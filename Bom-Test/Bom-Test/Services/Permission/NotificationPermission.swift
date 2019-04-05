//
//  NotificationPermission.swift
//  iOS Structure MVC
//
//  Created by vinhdd on 2/19/19.
//  Copyright © 2019 vinhdd. All rights reserved.
//

import UIKit
import UserNotifications

class NotificationPermission {
    
    // MARK: - Static variables
    static func getAuthorizationStatus(completion: @escaping ((_ status: UNAuthorizationStatus) -> Void)) {
        let current = UNUserNotificationCenter.current()
        current.getNotificationSettings(completionHandler: { settings in
            completion(settings.authorizationStatus)
        })
    }
}
