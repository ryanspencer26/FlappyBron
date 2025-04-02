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
    
    @IBOutlet weak var usernameLabel: UILabel!
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
        
        if let saved_player = UserDefaults.standard.data(forKey: "player"){
            
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode(Player.self, from: saved_player) {
                            
                AppData.player = decoded
                            
            }
            
        }
        
        if AppData.player == nil{
            
            let alert = UIAlertController(title: "Enter Username", message: "Looks like you're new to Flappy Bron! Please enter a username for us to use in the global leaderboards. Usernames must have at least 3 characters but not more than 20.", preferredStyle: .alert)
            
            alert.addTextField { field in
                
                field.placeholder = "username"
                
            }
            
            let submitAction = UIAlertAction(title: "Submit", style: .default, handler: {_ in
                
                guard let fields = alert.textFields, fields.count == 1 else{
                    
                    print("Invalid Entries")
                    return
                    
                }
            
                let field = fields[0]
                let username = field.text!
                
                if username.count <= 20 && username.count > 2{
                    
                    print(username)
                    
                    //Initializes the player & saves with persistence
                    
                    AppData.player = Player(username: username)
                    Player.save()
                    print("Player successfully initialized")
                    self.usernameLabel.text = "Signed in as: \(AppData.player!.username)"
                    
                } else {
                    
                    alert.title = "Invalid Entry"
                    self.present(alert, animated: true, completion: nil)
                    
                }
                
            })
            
            alert.addAction(submitAction)
            
            present(alert, animated: true, completion: nil)
            
        } else {
            
            self.usernameLabel.text = "Signed in as: \(AppData.player!.username)"
            
        }
        
        //print(AppData.player!.RP)
        
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
            play.userSprite.physicsBody?.velocity.dy = 500
        }
        
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
        play.ranked = false
        
    }
    
    @IBAction func startAction(_ sender: Any) {
        
        GameScene.addtoPlacement = true
        titleLabel.isHidden = true
        bronImage.isHidden = true
        startButton.isHidden = true
        rankedButton.isHidden = true
        infoButton.isHidden = true
        leaderboardButton.isHidden = true
        usernameLabel.isHidden = true
        gameStart()
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func updateScore(){
        
        startLabel.text = "Score: \(play.score)"
        
    }
    
    func gameOver(){
        
        sceneSet = false
        play.isHidden = true
        gameOverLabel.isHidden = true
        titleLabel.isHidden = false
        bronImage.isHidden = false
        startButton.isHidden = false
        rankedButton.isHidden = false
        infoButton.isHidden = false
        leaderboardButton.isHidden = false
        usernameLabel.isHidden = false
        startLabel.isHidden = true
        startLabel.text = "Tap to Start!"
        
    }
    
    @IBAction func unwindRanked(_ seg: UIStoryboardSegue){
        print("unwind")
        startAction(self)
        play.ranked = true
    }
    
}
