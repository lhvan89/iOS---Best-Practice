//
//  TodayViewController.swift
//  DemoCard
//
//  Created by Van Le on 8/14/18.
//  Copyright © 2018 Van Le. All rights reserved.
//

import UIKit
import SnapKit
import Cards

class TodayViewController: UIViewController {
    
    // tableView
    var tableView: UITableView! = {
        let tableView = UITableView()
        tableView.register(TodayHeaderTableCell.self, forCellReuseIdentifier: "todayHeaderCell")
        return tableView
    }()
    
    var cellItems: [Any] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeUI()
    }
    
    // MARK: Initialize UI
    func initializeUI(){
        
        self.cellItems.append(TodayHeaderTableCellItem(title: "Today", subTitle: "WEDNESDAY 15 AUGUST", urlImage: "avatar"))
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
