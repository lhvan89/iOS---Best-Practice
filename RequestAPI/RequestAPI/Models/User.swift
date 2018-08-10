//
//  User.swift
//  HushCity
//
//  Created by Huy Nguyễn on 10/31/16.
//  Copyright © 2016 Edge Works Software. All rights reserved.
//

import Foundation
import SwiftyJSON

class User: BaseModel {
    
    /// Creating singletone design pattern for User.AUTHENTICATION_TOKEN
    internal static var AUTHENTICATION_TOKEN: String!
    internal static var REFRESH_TOKEN: String!
    internal static var VERIFY_TOKEN: String!
    
    internal var username: String?
    internal var password: String?
    internal var email: String?
    internal var oldpassword: String?
    internal var verified: Bool?
    
    internal var lastname: String?
    internal var firstname: String?
    internal var gender: Bool?
    internal var age: Int?
    
    override init() {
        super.init()
    }
    
    required init(json: JSON) {
        super.init()

//        self.username = json["username"].stringValue
//        self.password = json["password"].stringValue
        User.AUTHENTICATION_TOKEN = json["access_token"].stringValue
        User.REFRESH_TOKEN = json["refresh_token"].stringValue
        User.VERIFY_TOKEN = json["verify_token"].stringValue
        
        let profile = json["profile"]
        self.lastname = profile["last_name"].stringValue
        self.firstname = profile["first_name"].stringValue
        self.gender = profile["last_name"].boolValue
        self.age = profile["last_name"].intValue
        self.verified = json["verified"].intValue == 1 ? true : false
    }
}
