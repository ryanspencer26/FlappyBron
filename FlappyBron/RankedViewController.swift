//
//  RankedViewController.swift
//  FlappyBron
//
//  Created by SEAN MCCAIN on 3/5/25.
//

import UIKit

class RankedViewController: UIViewController {

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var RPProgressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AppData.player?.RP = 1500
        AppData.player?.rank = 1
        
        if(AppData.player?.rank == 0){
            
            progressView.setProgress(Float(AppData.player!.RP)/1000.0, animated: true)
            
            RPProgressLabel.text = "\(1000-AppData.player!.RP)"
            
        }
        else if(AppData.player?.rank == 1){
            
            progressView.setProgress(Float(AppData.player!.RP-1000)/2000.0, animated: true)
            
            RPProgressLabel.text = "\(3000-AppData.player!.RP)"
            
        }
        
        
    }
    


}
