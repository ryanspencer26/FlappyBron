//
//  LeaderboardViewController.swift
//  FlappyBron
//
//  Created by SEAN MCCAIN on 3/6/25.
//

import UIKit

class LeaderboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
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
        
        if segmentControl.selectedSegmentIndex == 0 {
            if AppData.player!.rpRank > 0 {
                cell.numberLabel.text = "\(AppData.player!.rpRank)."
            } else {
                cell.numberLabel.text = "YOU"
            }
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
            cell.RPLabel.text = "\(AppData.player!.RP) RP"
            
        } else {
            
            if AppData.player!.scoreRank > 0 {
                cell.numberLabel.text = "\(AppData.player!.scoreRank)."
            } else {
                cell.numberLabel.text = "YOU"
            }
            cell.RPLabel.text = "\(AppData.player!.highScore) pts"
            
        }
        
        cell.usernameLabel.text = "\(AppData.player!.username)"
        
        return cell
        
    }
    
    @IBAction func segmentChanged(_ sender: Any) {
        tableView.reloadData()
    }

}
