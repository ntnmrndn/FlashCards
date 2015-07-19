//
//  LoginViewController.swift
//  FlashCards
//
//  Created by Antoine Marandon on 19/07/2015.
//  Copyright (c) 2015 Antoine Marandon. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    @IBOutlet var loginTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        Notification.userLoggedIn.addObserver(self, selector: "userLoggedIn")
    }


    deinit {
        Notification.removeObserver(self)
    }


    func userLoggedIn() {
        dismissViewControllerAnimated(true, completion: nil)
    }


    @IBAction func login() {
        APIManager.sharedInstance = APIManager(login: loginTextField.text)
        APIManager.sharedInstance?.doLogin()
    }
}