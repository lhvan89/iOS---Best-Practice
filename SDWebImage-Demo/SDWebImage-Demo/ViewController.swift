//
//  ViewController.swift
//  SDWebImage-Demo
//
//  Created by Van on 5/14/18.
//  Copyright © 2018 Van. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func clearCache(_ sender: UIBarButtonItem) {
        SDImageCache.shared().clearMemory()
        SDImageCache.shared().clearDisk()
        self.tableView.reloadData()
    }
    
    @IBAction func reloadTableView(_ sender: UIBarButtonItem) {
        self.tableView.reloadData()
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 123
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.initCell(id: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}
