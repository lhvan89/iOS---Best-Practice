//
//  ViewController.swift
//  Login Guide
//
//  Created by ✪ Lê Vấn ✪ on 5/30/18.
//  Copyright © 2018 Van. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let bearImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "bear_first")
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "Join use today in our fun and games!"
        textView.textAlignment = .center
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(bearImageView)
        view.addSubview(descriptionTextView)
        

        setupLayout()
        
    }
    
    func setupLayout(){
        bearImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        bearImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        bearImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        bearImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        descriptionTextView.topAnchor.constraint(equalTo: bearImageView.bottomAnchor, constant: 0).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}
