//
//  GroupDetailViewController.swift
//  World Cup 2018
//
//  Created by lhvan on 6/10/18.
//  Copyright © 2018 Van. All rights reserved.
//

import UIKit

class GroupDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        self.tableView.separatorColor = UIColor.clear
    }
}

extension GroupDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return groups.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups[section].teams.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupDetailTableViewCell") as! GroupDetailTableViewCell
        cell.initCell(team: groups[indexPath.section].teams[indexPath.row], rank: indexPath.row + 1)
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = Bundle.main.loadNibNamed("GroupDetailHeaderTableViewCell", owner: self, options: nil)?.first as! GroupDetailHeaderTableViewCell
        headerCell.title.text = "GROUP".localized() + " " + groups[section].groupName
        return headerCell
    }
}
