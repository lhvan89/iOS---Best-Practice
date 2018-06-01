//
//  ViewController.swift
//  World Cup 2018
//
//  Created by ✪ Lê Vấn ✪ on 5/31/18.
//  Copyright © 2018 Van. All rights reserved.
//

import UIKit
import Firebase

let screenWidth = UIScreen.main.bounds.width
let itemWidth = CGFloat(152.5)

class GroupsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var ref: DatabaseReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
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
        return UIEdgeInsets(top: 10, left: (screenWidth - itemWidth * 2) / 3, bottom: 10, right: (screenWidth - itemWidth * 2) / 3)
    }
}

