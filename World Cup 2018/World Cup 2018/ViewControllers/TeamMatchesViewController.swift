//
//  TeamMatchesViewController.swift
//  World Cup 2018
//
//  Created by lhvan on 6/10/18.
//  Copyright © 2018 Van. All rights reserved.
//

import UIKit

class TeamMatchesViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.sectionHeaderHeight = 40

        let nibName = UINib(nibName: "MatchesTableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "MatchesTableViewCell")
    }
}

extension TeamMatchesViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return scheduleTeam.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scheduleTeam[section].matches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MatchesTableViewCell") as!  MatchesTableViewCell
        cell.initCell(match: scheduleTeam[indexPath.section].matches[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = Bundle.main.loadNibNamed("MatchesHeaderTableViewCell", owner: self, options: nil)?.first as! MatchesHeaderTableViewCell
        
        let dayString = scheduleTeam[section].date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: dayString)
        
        headerCell.title.text = String.showFormatDate(date: date!)
        return headerCell
    }
}
