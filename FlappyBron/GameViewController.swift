//
//  GameViewController.swift
//  FlappyBron
//
//  Created by RYAN SPENCER on 2/24/25.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    var play: GameScene!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bronImage: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var gameOverLabel: UILabel!
    @IBOutlet weak var rankedButton: UIButton!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var leaderboardButton: UIButton!
    var sceneSet = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startLabel.isHidden = true
        gameOverLabel.isHidden = true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeLeft
    }
    
    @IBAction func tapRecognized(_ sender: Any) {
        
        if sceneSet {
            if !play.gameStarted {
                play.gameStarted = true
                play.userSprite.physicsBody?.affectedByGravity = true
                startLabel.text = "Score: \(play.score)"
                play.wall1.physicsBody?.velocity.dx = -500
                play.wall2.physicsBody?.velocity.dx = -500
                play.wall3.physicsBody?.velocity.dx = -500
                play.wall4.physicsBody?.velocity.dx = -500
                play.wall5.physicsBody?.velocity.dx = -500
                play.wall6.physicsBody?.velocity.dx = -500
            }
        }
        
        play.userSprite.physicsBody?.velocity.dy = 500
        
    }
    
    func gameStart(){
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // getting a ref to GameScene
                play = scene as? GameScene
                
                play.vc = self
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
        
        sceneSet = true
        startLabel.isHidden = false
        
    }
    
    @IBAction func startAction(_ sender: Any) {
        
        titleLabel.isHidden = true
        bronImage.isHidden = true
        startButton.isHidden = true
        rankedButton.isHidden = true
        infoButton.isHidden = true
        leaderboardButton.isHidden = true
        gameStart()
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func updateScore(){
        
        startLabel.text = "Score: \(play.score)"
        
    }
    
}
