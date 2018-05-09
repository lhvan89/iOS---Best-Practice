//
//  ViewController.swift
//  NoticeSwift
//
//  Created by Van on 5/9/18.
//  Copyright © 2018 Van. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        imageView.loadImage(fromURL: "http://mariduniya.net/wp-content/uploads/2017/07/pleasing-nature-wallpaper-hd-full-hd-1080p-wallpapers-desktop-backgrounds.jpg")
    }

}

extension UIImageView {
    
    func loadImage(fromURL urlString: String){
        self.pleaseWait()
        
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
                self.clearAllNotice()
            }
        }
    }
}
