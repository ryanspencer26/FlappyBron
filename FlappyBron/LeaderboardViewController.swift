//
//  LeaderboardViewController.swift
//  FlappyBron
//
//  Created by SEAN MCCAIN on 3/6/25.
//

import UIKit

class LeaderboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! PlayerCell
        
        cell.rankImage.image = UIImage(named: "lebron_icon_ranked.png")
        cell.usernameLabel.text = "De.Sean"
        cell.highScoreLabel.text = "1200"
        cell.RPLabel.text = "1200 RP"
        
        return cell
        
    }

}
