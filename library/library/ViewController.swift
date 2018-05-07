//
//  ViewController.swift
//  Library
//
//  Created by lhvan on 5/6/18.
//  Copyright © 2018 lhvan. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var myTag: TagListView!
    @IBOutlet weak var textField: UITextField!

    var tagList = [
        Tag(name: "Alphanumerics"),
        Tag(name: "Underscores"),
        Tag(name: "Minuses", isSelected: true),
        Tag(name: "Colons"),
        Tag(name: "Periods"),
        Tag(name: "Slashes", isSelected: true)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        myTag.delegate = self
        
        for tag in tagList {
            myTag.addTag(tag.name).isSelected = tag.isSelected
        }
        
    }
    
    @IBAction func addTagList(_ sender: Any) {
        guard let tag = textField.text else { return }
        myTag.addTag(tag)
    }
    
}

extension ViewController: TagListViewDelegate {
    
    func tagPressed(_ title: String, tagView: TagView, sender: TagListView) {
        tagView.isSelected = !tagView.isSelected
    }
    func tagRemoveButtonPressed(_ title: String, tagView: TagView, sender: TagListView) {
//        print("Removed \(title) \(sender)")
        sender.removeTagView(tagView)
    }
}
