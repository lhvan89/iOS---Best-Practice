//
//  TodayViewController.swift
//  Appstore iOS 11
//
//  Created by Van Le on 8/15/18.
//  Copyright © 2018 Van Le. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController {
    
    // tableView
    var tableView: UITableView! = {
        let tableView = UITableView()
        tableView.register(TodayHeaderTableCell.self, forCellReuseIdentifier: "todayHeaderCell")
        tableView.separatorStyle = .none
        return tableView
    }()
    
    var cellItems: [Any] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeUI()
    }
    
    // MARK: Initialize UI
    func initializeUI(){
        
        self.cellItems.append(TodayHeaderTableCellItem(title: "Today", subTitle: "WEDNESDAY 15 AUGUST", urlImage: "https://lh3.googleusercontent.com/-FcRjLUhBmwM/AAAAAAAAAAI/AAAAAAAAAAA/APUIFaNXrKZbFHtpZ2Biz8rMjCYEmFQirQ/s96-c-mo/photo.jpg"))
        self.view.addSubview(tableView)
        
        self.tableView.snp.makeConstraints { [weak self] (maker) in
            guard let strongSelf = self else { return }
            maker.edges.equalTo(strongSelf.view)
        }
        
        self.tableView.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension TodayViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todayHeaderCell") as! TodayHeaderTableCell
        if let cellItem = cellItems[indexPath.row] as? TodayHeaderTableCellItem {
            cell.cellItem = cellItem
            return cell
        }
        return UITableViewCell()
    }
    
}
