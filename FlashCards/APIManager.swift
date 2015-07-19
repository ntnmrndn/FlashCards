//
//  APIManager.swift
//  FlashCards
//
//  Created by Antoine Marandon on 19/07/2015.
//  Copyright (c) 2015 Antoine Marandon. All rights reserved.
//

import Foundation
import Alamofire

class APIManager {
    static var sharedInstance: APIManager?
    static let domain = "http://0.0.0.0:3000"

    let login: String
    let password: String

    init(login: String) {
        self.login = login
        self.password = "XXXNOPASSWORDYET"
    }


    static func imageURL(imageName: String) -> String {
        return "\(domain)/\(imageName)"
    }

    func doLogin() {
        let request =  doRequest(.GET, urlPath: "/login", parameters: nil)
        request.responseJSON(options: nil) { (_, _, JSON, error) -> Void in
            if let error = error {
                log.debug("Failed to login because \(error)")
                // return
            }
            //XXX parse response
            let user = User.userWith(self.login)
            User.currentUser = user
            Notification.userLoggedIn.post()
        }
    }


    private func doRequest(method: Alamofire.Method, urlPath: String, parameters: [String : AnyObject]? = nil) -> Alamofire.Request {
        setBasicAuth(self.login, hashedPassword: self.password)
        Alamofire.Manager.sharedInstance.session.configuration.timeoutIntervalForRequest = 10
        let encoding = method == .GET ? Alamofire.ParameterEncoding.URL : Alamofire.ParameterEncoding.JSON
        let request = Alamofire.request(method, APIManager.domain + urlPath, parameters: parameters, encoding: encoding)
        return request
    }


    private func setBasicAuth(login: String, hashedPassword: String) {
        //XXX change that once this is changed https://github.com/Alamofire/Alamofire/issues/32
        let plainString = "\(login):\(hashedPassword)" as NSString
        let plainData = plainString.dataUsingEncoding(NSUTF8StringEncoding)
        let base64String = plainData?.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0))
        Alamofire.Manager.sharedInstance.session.configuration.HTTPAdditionalHeaders = ["Authorization": "Basic " + base64String!]
    }
}