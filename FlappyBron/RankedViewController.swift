//
//  RankedViewController.swift
//  FlappyBron
//
//  Created by SEAN MCCAIN on 3/5/25.
//

import UIKit

class RankedViewController: UIViewController {

    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        progressView.setProgress(0.75, animated: true)
        
    }
    


}
