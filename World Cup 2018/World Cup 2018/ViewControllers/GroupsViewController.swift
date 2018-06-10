//
//  ViewController.swift
//  World Cup 2018
//
//  Created by ✪ Lê Vấn ✪ on 5/31/18.
//  Copyright © 2018 Van. All rights reserved.
//

import UIKit
import Firebase

//let screenWidth = UIScreen.main.bounds.width
var screenWidth = UIScreen.main.bounds.width
let itemWidth = CGFloat(152.5)

class GroupsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var ref: DatabaseReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "GROUPS".localized()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewWillLayoutSubviews() {
        screenWidth = UIScreen.main.bounds.width
        collectionView.reloadData()
        print(screenWidth)
    }
}

extension GroupsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GroupsCollectionViewCell", for: indexPath) as! GroupsCollectionViewCell
        cell.initCell(group: groups[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: itemWidth, height: itemWidth*(638/612))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        var insets:CGFloat = 0
        if screenWidth < itemWidth * 3 {
            insets = (screenWidth - itemWidth * 2) / 3
        }else if screenWidth < itemWidth * 4 {
            insets = (screenWidth - itemWidth * 3) / 4
        }else{
            insets = (screenWidth - itemWidth * 4) / 5
        }
        return UIEdgeInsets(top: 10, left: insets, bottom: 10, right: insets)
    }
}

