//
//  ViewController.swift
//  RequestAPI
//
//  Created by lhvan on 6/25/18.
//  Copyright © 2018 lhvan89. All rights reserved.
//

import UIKit

class LeaderboardViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var weekLabel: UILabel!
    
    var leaderboard: Leaderboard!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHeaderView()
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func configureHeaderView() {
        let gradient = CAGradientLayer()
        gradient.frame = headerView.bounds
        gradient.colors = [
            UIColor(red:0.35, green:0.36, blue:0.43, alpha:1).cgColor,
            UIColor(red:0.18, green:0.18, blue:0.23, alpha:1).cgColor
        ]
        gradient.locations = [0, 1]
        gradient.startPoint = CGPoint(x: 0.09, y: 0.18)
        gradient.endPoint = CGPoint(x: 0.91, y: 0.76)
        self.headerView.layer.addSublayer(gradient)
    }
}

extension LeaderboardViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let leaderboard = leaderboard else { return 0 }
        return leaderboard.contributors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeaderboardTableViewCell") as! LeaderboardTableViewCell
        cell.handleData(contributor: leaderboard.contributors[indexPath.row], rank: indexPath.row + 1)
        return cell
    }
}

extension LeaderboardViewController: SurveyRequestDelegate {
}







