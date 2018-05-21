//
//  AppDelegate.swift
//  Deep-Link-Demo
//
//  Created by ✪ Lê Vấn ✪ on 5/21/18.
//  Copyright © 2018 Van. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        var schemes = [String]()
        
        if let bundleURLTypes = Bundle.main.infoDictionary?["CFBundleURLTypes"] as? [NSDictionary] {
            for bundleURLType in bundleURLTypes {
                if let scheme = bundleURLType["CFBundleURLSchemes"] {
                    if let streamArray = scheme as? [String] {
                        schemes += streamArray
                    }
                }
            }
        }
        
        schemes = schemes.map({ (s) -> String in
            return s.lowercased()
        })
        
        if ("error" == url.host) {
            print("error")
            return false
        }
        
        guard schemes.contains((url.scheme?.lowercased())!) else {
            print("unknown")
            return false
        }
        
        let paths = url.pathComponents
        
        guard paths.count > 0 else {
            print("invalid url path")
            return false
        }
        
        let urlComponents = NSURLComponents(url: url, resolvingAgainstBaseURL: false)
        
        if paths.count == 2 {
            if paths[1] == "detail" {
                if let queryItems = urlComponents?.queryItems, queryItems.count == 1 &&
                    queryItems[0].name == "id"
                {
                    if let id = queryItems[0].value {
                        showProduct(id: id)
                    }
                }
            }
        }
        
        return true
    }
    func showProduct(id: String) {
//        guard let product = ProductDataSource.sharedInstance[id] else {
//            return
//        }
//        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProductDetailViewController") as? ProductDetailViewController {
//            vc.product = product
//            vc.setupCloseButton()
//            let nav = UINavigationController(rootViewController: vc)
//            
//            self.window?.rootViewController?.present(nav, animated: true, completion: nil)
//        }
    }

}

