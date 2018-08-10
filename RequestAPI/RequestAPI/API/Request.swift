//
//  Request.swift
//  HushCity
//
//  Created by Huy Nguyễn on 10/31/16.
//  Copyright © 2016 Edge Works Software. All rights reserved.
//

import Foundation
import Alamofire

enum InitType {
    case Normal
    case AuthToken
}

@objc protocol RequestDelegate {
    /**
     This method is called from all subclasses of Reqest class when some request get fail
     */
    @objc optional func requestFail(message: String?)
    
    /**
     This method is called when request is pass but is empty or uknown data
     
     - parameter data: optional AnyObject?
     */
    @objc optional func requestPass(data: AnyObject?)
}

class Request: NSObject {
    
    // MARK: - Private API
    private let configuration = URLSessionConfiguration.default
    private var _networkManager: NetworkReachabilityManager!
    private var _manager: Alamofire.SessionManager!
    private let serverTrustPolicies: [String: ServerTrustPolicy] = [
        "\(HOST)": .pinCertificates(
            certificates: ServerTrustPolicy.certificates(in: Bundle.main),
            validateCertificateChain: false,
            validateHost: true
        )
    ]
    
//    ,
//    "118.69.224.184:4443": .disableEvaluation,
//    "118.69.224.184": .disableEvaluation
    
    // MARK: - Public API
    internal var manager: Alamofire.SessionManager! {
        get {
            
            // Self protected
            if _manager == nil {
                _manager = Alamofire.SessionManager()
            }
            
            return _manager
        }
    }
    
    internal var networkManager: NetworkReachabilityManager! {
        get {
            
            // Self protected
            if _networkManager == nil {
                _networkManager = NetworkReachabilityManager(host: MAIN_URL)
            }
            
            return _networkManager
        }
    }
    
    /// Request parameters
    internal var parameters: [String: AnyObject]?
    
    /// Delegate
    internal var delegate: RequestDelegate?
    
    /**
     This method handle is some request has an error, and print it in console.
     
     - parameter operation: AFHTTPRequestOperationObject
     */
    internal func getErrorMessage(error: Error) {
        print("Request failed with error: \(error)")
        let _nsErr = error as NSError
        if let messageErr = _nsErr.userInfo[NSLocalizedDescriptionKey] as? String {
            HCToastView.showToast(withText: messageErr)
        } else {
            HCToastView.showToast(withText: "Could not connect to the server.")
        }
    }
    
    internal func errorMessageFromError(error: Error) -> String {
        if let message = (error as NSError).userInfo[NSLocalizedDescriptionKey] as? String {
            return message
        } else {
            return "Could not connect to the server."
        }
    }
    
    /**
     Initializaton
     
     - returns: Request object
     */
    override init() {
        super.init()
    }
    
    init(initType: InitType) {
        super.init()
        
        // Check initType
        switch initType {
        case .Normal:
            allocateManager()
        case .AuthToken:
            authorizeUser()
        }
    }
    
    /**
     Creating instance of AFHTTPRequestOperationManager
     */
    private func allocateManager() { }
    
    /**
     Set AUTHENTICATION_TOKEN in content-header and creating instance of AFHTTPRequestOperationManager
     */
    private func authorizeUser() {
        
        // allocateManager
        self.allocateManager()
        
        /**
         *  Set AUTHENTICATION_TOKEN in Request-AUTHORIZATION_HEADER
         */
        var defaultHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        defaultHeaders[AUTHORIZATION_HEADER] = NSString(format: "Bearer %@", User.AUTHENTICATION_TOKEN) as String
        self.configuration.httpAdditionalHeaders = defaultHeaders
    }
}
