//
//  TeamViewController.swift
//  World Cup 2018
//
//  Created by lhvan on 6/11/18.
//  Copyright © 2018 Van. All rights reserved.
//

import UIKit

class TeamViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var teams: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in groups {
            for j in i.teams {
                teams.append(j.teamName)
            }
        }
        
        teams = teams.sorted(by: { (s1, s2) -> Bool in
            return s1 < s2
        })
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewWillLayoutSubviews() {
        screenWidth = UIScreen.main.bounds.width
        collectionView.reloadData()
        print(screenWidth)
    }
}



extension TeamViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teams.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TeamCollectionViewCell", for: indexPath) as! TeamCollectionViewCell
        cell.initCell(teamName: teams[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: itemWidth, height: itemWidth*(320/290))
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
        return UIEdgeInsets(top: 10, left: insets, bottom: 20, right: insets)
    }
}

