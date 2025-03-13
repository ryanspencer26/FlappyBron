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
        
        switch AppData.player!.rank {
        case 1:
            cell.rankImage.image = UIImage(named: "lebronze_icon_ranked")
        case 2:
            cell.rankImage.image = UIImage(named: "lesilver_icon_ranked.png")
        case 3:
            cell.rankImage.image = UIImage(named: "legold_icon_ranked.png")
        case 4:
            cell.rankImage.image = UIImage(named: "lediamond_icon_ranked.png")
        case 5:
            cell.rankImage.image = UIImage(named: "lebron_icon_ranked.png")
        case 6:
            cell.rankImage.image = UIImage(named: "goat_icon_ranked.png")
        default:
            cell.rankImage.image = UIImage(named: "unranked_icon_ranked.png")
        }
        
        cell.usernameLabel.text = "\(AppData.player!.username)"
        cell.highScoreLabel.text = "\(AppData.player!.highScore) pts"
        cell.RPLabel.text = "\(AppData.player!.RP) RP"
        
        if AppData.player!.globalRank > 0 {
            cell.numberLabel.text = "\(AppData.player!.globalRank)."
        } else {
            cell.numberLabel.text = "YOU"
        }
        
        return cell
        
    }

}
