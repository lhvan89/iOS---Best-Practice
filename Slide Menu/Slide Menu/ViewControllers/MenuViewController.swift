//
//  MenuViewController.swift
//  Slide Menu
//
//  Created by ✪ Lê Vấn ✪ on 5/29/18.
//  Copyright © 2018 Van. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let arrMenuName = ["Home", "Profile", "Orders", "Settings", "Logout"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorColor = UIColor.clear
        
        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMenuName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellMenu") as! MenuTableViewCell
        cell.imageIcon.image = UIImage(named: arrMenuName[indexPath.row])
        cell.labelName.text = arrMenuName[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let menuName = arrMenuName[indexPath.row]
        
        self.performSegue(withIdentifier: menuName, sender: self)
        
    }
    
}




















