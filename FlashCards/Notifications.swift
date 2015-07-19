//
//  Notifications.swift
//  FlashCards
//
//  Created by Antoine Marandon on 19/07/2015.
//  Copyright (c) 2015 Antoine Marandon. All rights reserved.
//

import Foundation


enum Notification: UInt {
    case userLoggedIn

    private var notificationName: String {
        return "Notification\(self.rawValue)"
    }


    func post() {
        NSNotificationCenter.defaultCenter().postNotificationName(notificationName, object: nil)
    }


    func addObserver(observer: NSObject, selector: Selector) {
        NSNotificationCenter.defaultCenter().addObserver(observer, selector: selector, name: notificationName, object: nil)
    }


    static func removeObserver(observer: NSObject) {
        NSNotificationCenter.defaultCenter().removeObserver(observer)
    }
}