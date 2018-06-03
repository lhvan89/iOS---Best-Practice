//
//  MatchesViewController.swift
//  World Cup 2018
//
//  Created by lhvan on 6/3/18.
//  Copyright © 2018 Van. All rights reserved.
//

import UIKit

class MatchesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
}

extension MatchesViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return schedule.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schedule[section].matches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MatchesTableViewCell") as!  MatchesTableViewCell
        cell.initCell(match: schedule[indexPath.section].matches[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return schedule[section].date
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        let headerImageView = UIImageView(image: #imageLiteral(resourceName: "bg_darkblue"))
        headerImageView.contentMode = .scaleAspectFill
        headerImageView.clipsToBounds = true
        
        header.backgroundView = headerImageView

        header.backgroundColor = UIColor.clear
        header.tintColor = UIColor.clear
        header.textLabel?.font = UIFont(name: "Open Sans", size: 15)
        header.textLabel?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        header.textLabel?.textAlignment = NSTextAlignment.left
    }
}









