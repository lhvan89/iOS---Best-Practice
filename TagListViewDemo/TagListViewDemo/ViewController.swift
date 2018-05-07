//
//  ViewController.swift
//  TagListViewDemo
//
//  Created by lhvan on 5/6/18.
//  Copyright © 2018 lhvan. All rights reserved.
//

import UIKit
import TagListView

class ViewController: UIViewController, TagListViewDelegate {
    @IBOutlet weak var tagList: TagListView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tagList.delegate = self
        
        tagList.addTag("Hello")
        tagList.addTag("Welcome")
        tagList.addTag("Book")
        tagList.addTag("Tivi show")
        tagList.addTag("Hello")
        tagList.addTag("Welcome")
        tagList.addTag("Book")
        tagList.addTag("Tivi show")
        tagList.addTag("Hello")
        tagList.addTag("Welcome")
        tagList.addTag("Book")
        tagList.addTag("Tivi show")
        tagList.addTag("Hello")
        tagList.addTag("Welcome")
        tagList.addTag("Book")
        tagList.addTag("Tivi show")
        tagList.addTag("sdf")
        tagList.addTag("iPhone")
    }
    
    func tagPressed(_ title: String, tagView: TagView, sender: TagListView) {
        tagView.isSelected = !tagView.isSelected
    }
    func tagRemoveButtonPressed(_ title: String, tagView: TagView, sender: TagListView) {
        tagList.removeTagView(tagView)
    }
}
