//
//  userRequest.swift
//  HushCity
//
//  Created by Huy Nguyễn on 10/31/16.
//  Copyright © 2016 Edge Works Software. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

@objc protocol UserRequestDelegate: RequestDelegate {
    
    @objc optional func userRequest(userRequest: UserRequest, didSuccessfullySignUpWithUser user: User)
    
    @objc optional func userRequest(userRequest: UserRequest, didSuccessfullyChangeEmailWithStatus status: Int)
    
    @objc optional func userRequest(userRequest: UserRequest, didSuccessfullyResetPasswordWithStatus status: Int)
    
    @objc optional func userRequest(userRequest: UserRequest, didSuccessfullySignInWithUser user: User)
    
    @objc optional func userRequest(userRequest: UserRequest, didSuccessfullyChangePasswordWithStatus status: Int)
    
    @objc optional func userRequest(userRequest: UserRequest, didSuccessfullyFeedBackWithStatus status: Int)
    
    @objc optional func userRequest(userRequest: UserRequest, didSuccessfullyGetProjectCreditUrl data: ProjectCreditModel)
    
    @objc optional func userRequest(userRequest: UserRequest, didSuccessfullyCloseAcount status: Int)
}

class UserRequest: Request {
    
    internal func signUp(user: User) {
        
        let profile = ["first_name": "Hush" as AnyObject, "last_name": "City" as AnyObject, "gender": 0 as AnyObject, "age": 0 as AnyObject]
        self.parameters = [USERNAME: user.username! as AnyObject, PASSWORD: user.password! as AnyObject, EMAIL: user.email! as AnyObject, "profile": profile as AnyObject]
        
        self.manager.request(Router.signUp(parameters: self.parameters!))
            .validate()
            .responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    print(value)
                    let response = JSON(json: value)
                    let errCode = response[ERRORCODE].intValue
                    if errCode == 0 {
                        let data = response[RESPONSE_DATA]
                        let user = User(json: data)
                        (self.delegate as! UserRequestDelegate).userRequest!(userRequest: self, didSuccessfullySignUpWithUser: user)
                    } else {
                        (self.delegate as! UserRequestDelegate).requestFail!(message: response[ERRORMESSAGE].stringValue)
                    }
                case .failure(let error):
                    print(error)
                    (self.delegate as! UserRequestDelegate).requestFail!(message: self.errorMessageFromError(error: error))
                }
        }
    }
    
    internal func signIn(user: User) {
        
        self.parameters = [USERNAME: user.username! as AnyObject, PASSWORD: user.password! as AnyObject]
        
        self.manager.request(Router.signIn(parameters: self.parameters!))
            .validate()
            .responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    print(value)
                    let response = JSON(json: value)
                    let errCode = response[ERRORCODE].intValue
                    if errCode == 0 {
                        let data = response[RESPONSE_DATA]
                        let user = User(json: data)
                        (self.delegate as! UserRequestDelegate).userRequest!(userRequest: self, didSuccessfullySignInWithUser: user)
                    } else {
                        (self.delegate as! UserRequestDelegate).requestFail!(message: response[ERRORMESSAGE].stringValue)
                    }
                case .failure(let error):
                    print(error)
                    (self.delegate as! UserRequestDelegate).requestFail!(message: self.errorMessageFromError(error: error))
                }
        }
    }
    
    internal func socialSignIn(type: String, accessToken: String, accessTokenSecret: String) {
        
        self.parameters = ["type": type as AnyObject, "access_token": accessToken as AnyObject, "access_token_secret": accessTokenSecret as AnyObject]
        
        self.manager.request(Router.signIn(parameters: self.parameters!))
            .validate()
            .responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    print(value)
                    let response = JSON(json: value)
                    let errCode = response[ERRORCODE].intValue
                    if errCode == 0 {
                        let data = response[RESPONSE_DATA]
                        let user = User(json: data)
                        (self.delegate as! UserRequestDelegate).userRequest!(userRequest: self, didSuccessfullySignInWithUser: user)
                    } else {
                        (self.delegate as! UserRequestDelegate).requestFail!(message: response[ERRORMESSAGE].stringValue)
                    }
                case .failure(let error):
                    print(error)
                    (self.delegate as! UserRequestDelegate).requestFail!(message: self.errorMessageFromError(error: error))
                }
        }
    }
    
    internal func changeEmail(user: User, resend: Int) {
        
        self.parameters = [VERIFY_TOKEN: User.VERIFY_TOKEN as AnyObject, USERNAME: user.username! as AnyObject, PASSWORD: user.password! as AnyObject, EMAIL: user.email! as AnyObject, RESEND: resend as AnyObject]
        self.manager.request(Router.changeEmail(prameters: self.parameters!))
            .validate()
            .responseJSON(completionHandler: {
                response in
                switch response.result{
                case .success(let value):
                    print(value)
                    let response = JSON(json: value)
                    let errCode = response[ERRORCODE].intValue
                    if errCode == 0 {
                        let data = response[RESPONSE_DATA]
                        User.VERIFY_TOKEN = data["verify_token"].stringValue
                        (self.delegate as! UserRequestDelegate).userRequest!(userRequest: self, didSuccessfullyChangeEmailWithStatus: errCode)
                    } else {
                        (self.delegate as! UserRequestDelegate).requestFail!(message: response[ERRORMESSAGE].stringValue)
                    }
                case .failure(let error):
                    print(error)
                    (self.delegate as! UserRequestDelegate).requestFail!(message: self.errorMessageFromError(error: error))
                }
            })
    }
    
    internal func resetPassword(user: User) {
        
        self.parameters = [USERNAME: user.username! as AnyObject, EMAIL: user.email! as AnyObject]
        self.manager.request(Router.resetPassword(prameters: self.parameters!))
            .validate()
            .responseJSON(completionHandler: {
                response in
                switch response.result{
                case .success(let value):
                    print(value)
                    let response = JSON(json: value)
                    let errCode = response[ERRORCODE].intValue
                    if errCode == 0 {
                        (self.delegate as! UserRequestDelegate).userRequest!(userRequest: self, didSuccessfullyResetPasswordWithStatus: errCode)
                    } else {
                        (self.delegate as! UserRequestDelegate).requestFail!(message: response[ERRORMESSAGE].stringValue)
                    }
                case .failure(let error):
                    print(error)
                    (self.delegate as! UserRequestDelegate).requestFail!(message: self.errorMessageFromError(error: error))
                }
            })
    }
    
    internal func renewToken(success: @escaping () -> (), failure: @escaping () -> ()) {
        
        self.parameters = [REFRESH_TOKEN: User.REFRESH_TOKEN as AnyObject]
        
        self.manager.request(Router.renewToken(parameters: self.parameters!))
            .validate()
            .responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    print(value)
                    let response = JSON(json: value)
                    let errCode = response[ERRORCODE].intValue
                    if errCode == 0 {
                        User.AUTHENTICATION_TOKEN = response[RESPONSE_DATA][ACCESS_TOKEN].stringValue
                        success()
                    } else {
                        failure()
                    }
                case .failure(let error):
                    print(error)
                    failure()
                    break
                }
        }
    }
    
    internal func changePassword(user: User) {
        
        self.parameters = [ACCESS_TOKEN: User.AUTHENTICATION_TOKEN as AnyObject, OLDPASSWORD: user.oldpassword as AnyObject, PASSWORD: user.password as AnyObject]
        self.manager.request(Router.changePassword(prameters: self.parameters!))
            .validate()
            .responseJSON(completionHandler: {
                response in
                switch response.result{
                case .success(let value):
                    print(value)
                    let response = JSON(json: value)
                    let errCode = response[ERRORCODE].intValue
                    if errCode == 0 {
                        (self.delegate as! UserRequestDelegate).userRequest!(userRequest: self, didSuccessfullyChangePasswordWithStatus: errCode)
                    } else if errCode == 401 {
                        self.renewToken(success: {
                            self.changePassword(user: user)
                        }, failure: {
                            (self.delegate as! UserRequestDelegate).userRequest!(userRequest: self, didSuccessfullyChangePasswordWithStatus: errCode)
                        })
                    } else {
                        (self.delegate as! UserRequestDelegate).userRequest!(userRequest: self, didSuccessfullyChangePasswordWithStatus: errCode)
                    }
                case .failure(let error):
                    print(error)
                    (self.delegate as! UserRequestDelegate).requestFail!(message: self.errorMessageFromError(error: error))
                }
            })
    }
    
    internal func closeAccount(){
        self.parameters = [ACCESS_TOKEN: User.AUTHENTICATION_TOKEN as AnyObject]
        self.manager.request(Router.closeAccount(parameters: self.parameters!))
            .validate()
            .responseJSON(completionHandler: {
                response in
                switch response.result{
                case .success(let value):
                    print(value)
                    let response = JSON(json: value)
                    let errCode = response[ERRORCODE].intValue
                    if errCode == 0 {
                        (self.delegate as! UserRequestDelegate).userRequest!(userRequest: self, didSuccessfullyCloseAcount: errCode)
                    } else if errCode == 401 {
                        self.renewToken(success: {
                            self.closeAccount()
                        }, failure: {
                            (self.delegate as! UserRequestDelegate).userRequest!(userRequest: self, didSuccessfullyCloseAcount: errCode)
                        })
                    } else {
                        (self.delegate as! UserRequestDelegate).userRequest!(userRequest: self, didSuccessfullyCloseAcount: errCode)
                    }
                case .failure(let error):
                    print(error)
                    (self.delegate as! UserRequestDelegate).requestFail!(message: self.errorMessageFromError(error: error))
                }
            })
    }
    
    internal func submitFeedBack(feedBack: FeedBackModel) {
        
        self.parameters = [ACCESS_TOKEN: User.AUTHENTICATION_TOKEN as AnyObject, RATING: feedBack.rating as AnyObject, COMMENT: feedBack.comment as AnyObject ]
        self.manager.request(Router.sendFeedback(parameters: self.parameters!))
            .validate()
            .responseJSON(completionHandler: {
                response in
                switch response.result{
                case .success(let value):
                    print(value)
                    let response = JSON(json: value)
                    let errCode = response[ERRORCODE].intValue
                    if errCode == 0 {
                        (self.delegate as! UserRequestDelegate).userRequest!(userRequest: self, didSuccessfullyFeedBackWithStatus: errCode)
                    } else if errCode == 401 {
                        self.renewToken(success: {
                            self.submitFeedBack(feedBack: feedBack)
                        }, failure: {
                            (self.delegate as! UserRequestDelegate).userRequest!(userRequest: self, didSuccessfullyFeedBackWithStatus: errCode)
                        })
                    } else {
                        (self.delegate as! UserRequestDelegate).userRequest!(userRequest: self, didSuccessfullyFeedBackWithStatus: errCode)
                    }
                case .failure(let error):
                    print(error)
                    (self.delegate as! UserRequestDelegate).requestFail!(message: self.errorMessageFromError(error: error))
                }
            })
    }
    
    // MARK: - Initialization
    override init(initType: InitType) {
        super.init(initType: initType)
    }
}

enum Router: URLRequestConvertible {
    
    case signUp(parameters: Parameters)
    case signIn(parameters: Parameters)
    case renewToken(parameters:Parameters)
    case changePassword(prameters: Parameters)
    case sendFeedback(parameters:Parameters)
    case changeEmail(prameters: Parameters)
    case resetPassword(prameters: Parameters)
    case closeAccount(parameters: Parameters)
    
    var method: HTTPMethod {
        
        switch self {
        case .signUp:
            return .post
        case .signIn:
            return .post
        case .renewToken:
            return .post
        case .changePassword:
            return .post
        case .sendFeedback:
            return .post
        case .changeEmail:
            return .post
        case .resetPassword:
            return .post
        case .closeAccount:
            return .post
        }
    }
    
    var path: String {
        
        switch self {
        case .signUp:
            return "signup"
        case .signIn:
            return "signin"
        case .renewToken:
            return "renew_token"
        case .changePassword:
            return "change_password"
        case .sendFeedback:
            return "submit_rating"
        case .changeEmail:
            return "change_email"
        case .resetPassword:
            return "forgot_password"
        case .closeAccount:
            return "close_account"
        }
    }
    
    // MARK: URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        
        let url = try MAIN_URL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .signUp(let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .signIn(let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .renewToken(let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .changePassword(let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .sendFeedback(let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .changeEmail(let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .resetPassword(let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .closeAccount(let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        }
        
        return urlRequest
    }
    
}
