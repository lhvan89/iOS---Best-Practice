//
//  ExtensionUIImageview.swift
//  Pokemon-Deeplinks
//
//  Created by lhvan on 5/25/18.
//  Copyright © 2018 lhvan. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func loadImage(fromURL urlString: String){
        
        // Config activityIndicator
        let activity =  UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activity.center = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2)
        
        activity.hidesWhenStopped = true
        activity.startAnimating()
        
        self.addSubview(activity)
        
        // Load image with multithreading
        let queue = DispatchQueue(label: "queue")
        queue.async {
            let url = URL(string: urlString)
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.sync {
                self.image = UIImage(data: data!)
                activity.stopAnimating()
            }
        }
    }
}
