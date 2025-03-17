//
//  RankedViewController.swift
//  FlappyBron
//
//  Created by SEAN MCCAIN on 3/5/25.
//

import UIKit

class RankedViewController: UIViewController {

    @IBOutlet weak var RPdescriptorLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var RPProgressLabel: UILabel!
    @IBOutlet weak var rankImage: UIImageView!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var placementGamesLabel: UILabel!
    @IBOutlet weak var pleacementDescriptor: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if AppData.player!.games.count < 10{
            
            placementGamesLabel.text = "\(AppData.player!.games.count)/10"
            
        }
        else{
            
            placementGamesLabel.text = "\(AppData.player!.RP)"
            pleacementDescriptor.text = "CURRENT RP"
            
        }
        
        
        if(AppData.player!.RP < 1000){
            
            rankImage.image = UIImage(named: "unranked_icon_ranked")
            rankLabel.text = "UNRANKED"
            
            progressView.setProgress(Float(AppData.player!.RP)/1000.0, animated: true)
            
            RPProgressLabel.text = "\(1000-AppData.player!.RP)"
            RPdescriptorLabel.text = "RP TO NEXT RANK"

            
        }
        else if(AppData.player!.RP < 3000){
            
            progressView.setProgress(Float(AppData.player!.RP-1000)/2000.0, animated: true)
            
            RPProgressLabel.text = "\(3000-AppData.player!.RP)"
            
            rankImage.image = UIImage(named: "lebronze_icon_ranked")
            rankLabel.text = "LEBRONZE"
            RPdescriptorLabel.text = "RP TO NEXT RANK"

            
        }
        else if(AppData.player!.RP < 6000){
            
            progressView.setProgress(Float(AppData.player!.RP-3000)/3000.0, animated: true)
            
            RPProgressLabel.text = "\(6000-AppData.player!.RP)"
            
            rankImage.image = UIImage(named: "lesilver_icon_ranked")
            rankLabel.text = "LESILVER"
            RPdescriptorLabel.text = "RP TO NEXT RANK"

            
        }
        else if(AppData.player!.RP < 10000){
            
            progressView.setProgress(Float(AppData.player!.RP-6000)/4000.0, animated: true)
            
            RPProgressLabel.text = "\(10000-AppData.player!.RP)"
            
            rankImage.image = UIImage(named: "legold_icon_ranked")
            rankLabel.text = "LEGOLD"
            RPdescriptorLabel.text = "RP TO NEXT RANK"

            
        }
        else if(AppData.player!.RP < 15000){
            
            progressView.setProgress(Float(AppData.player!.RP-10000)/5000.0, animated: true)
            
            RPProgressLabel.text = "\(15000-AppData.player!.RP)"
            
            rankImage.image = UIImage(named: "lediamond_icon_ranked")
            rankLabel.text = "LEDIAMOND"
            RPdescriptorLabel.text = "RP TO NEXT RANK"

            
        }
        else if(AppData.player!.RP < 25000){
            
            progressView.setProgress(Float(AppData.player!.RP-15000)/10000.0, animated: true)
            
            RPProgressLabel.text = "\(25000-AppData.player!.RP)"
            
            rankImage.image = UIImage(named: "lebron_icon_ranked")
            rankLabel.text = "LEBRON"
            RPdescriptorLabel.text = "RP TO NEXT RANK"
            
        }
        else{
            
            progressView.isHidden = true
            
            RPProgressLabel.text = ""
            
            rankImage.image = UIImage(named: "goat_icon_ranked")
            rankLabel.text = "GOAT"
            
            RPdescriptorLabel.text = ""
            
        }
        
    }
    
    @IBAction func playRanked(_ sender: Any) {
        print("queuing ranked")
        self.dismiss(animated: true)
    }
    
}
