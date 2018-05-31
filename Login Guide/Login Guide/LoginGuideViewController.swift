//
//  LoginGuideViewController.swift
//  Login Guide
//
//  Created by ✪ Lê Vấn ✪ on 5/30/18.
//  Copyright © 2018 Van. All rights reserved.
//

import UIKit

struct Page {
    let imageName: String
    let headerText: String
    let bodyText: String
}

class LoginGuideViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    let pages:[Page] = [
        Page(imageName: "bear_first", headerText: "Quiet Area", bodyText: "Get to know where is quiet, where is noisy by Hushcity app."),
        Page(imageName: "heart_second", headerText: "Survey", bodyText: "Doing a survey to let people know how noisy the place is."),
        Page(imageName: "leaf_third", headerText: "Share", bodyText: "Join community to share quite area to your friends.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        pageControl.numberOfPages = pages.count
    }
    
    @IBAction func handlePrev(_ sender: Any) {
        let prevIndex = max(self.pageControl.currentPage - 1, 0)
        self.pageControl.currentPage = prevIndex
        let indexPath = IndexPath(item: prevIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
    }
    
    @IBAction func handleNext(_ sender: Any) {
        let nextIndex = min(self.pageControl.currentPage + 1, pages.count - 1)
        self.pageControl.currentPage = nextIndex
        let indexPath = IndexPath(item: nextIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
}

extension LoginGuideViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CellCollectionViewCell
        
        cell.imageOnboarding.image = UIImage(named: pages[indexPath.item].imageName)
        cell.headerText.text = pages[indexPath.item].headerText
        cell.bodyText.text = pages[indexPath.item].bodyText
        
        
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height)
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x/view.frame.width)
    }
}
