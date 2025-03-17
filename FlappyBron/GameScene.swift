//
//  GameScene.swift
//  FlappyBron
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    static var addtoPlacement = false
    var userSprite : SKSpriteNode!
    var wall1: SKSpriteNode!
    var wall2: SKSpriteNode!
    var wall3: SKSpriteNode!
    var wall4: SKSpriteNode!
    var wall5: SKSpriteNode!
    var wall6: SKSpriteNode!
    private var label : SKLabelNode?
    public var vc : GameViewController!
    public var gameStarted = false
    public var gameOver = false
    public var score = 0
    public var getPoints1 = true
    public var getPoints2 = true
    public var getPoints3 = true
    public var screenSize: CGRect!
    public var ranked = false
    public var powerupSpawned = false
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        userSprite = self.childNode(withName: "user") as! SKSpriteNode
        wall1 = self.childNode(withName: "wall1") as! SKSpriteNode
        wall2 = self.childNode(withName: "wall2") as! SKSpriteNode
        wall3 = self.childNode(withName: "wall3") as! SKSpriteNode
        wall4 = self.childNode(withName: "wall4") as! SKSpriteNode
        wall5 = self.childNode(withName: "wall5") as! SKSpriteNode
        wall6 = self.childNode(withName: "wall6") as! SKSpriteNode
        screenSize = UIScreen.main.bounds
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        userSprite.physicsBody?.pinned = true
        wall1.physicsBody?.pinned = true
        wall2.physicsBody?.pinned = true
        wall3.physicsBody?.pinned = true
        wall4.physicsBody?.pinned = true
        wall5.physicsBody?.pinned = true
        wall6.physicsBody?.pinned = true
        gameOver = true
        vc.gameOverLabel.isHidden = false
        
        if score > AppData.player!.highScore {
            AppData.player!.highScore = score
            Player.save()
        }
        
        if AppData.player!.games.count < 10 && ranked && GameScene.addtoPlacement {
            GameScene.addtoPlacement = false
            AppData.player!.games.append(Game(score: score))
            print("Game Saved to Placement Games")
            Player.save()
            
            if(AppData.player!.games.count == 10){
                
                var initialRP = 0
                
                for game in AppData.player!.games{
                    
                    print(game.score)
                    initialRP += game.score
                    
                }
                initialRP /= 10
                
                if initialRP > 500{
                    
                    initialRP = 500
                    
                }
                AppData.player!.RP += initialRP
                
            }
            
        }
        
        let alert = UIAlertController(title: "Game Over", message: "Would you like to play again?", preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Yes", style: .default) { (alert) in
            
            GameScene.addtoPlacement = true
            self.wall1.position.x = 0.033
            self.wall2.position.x = 0.033
            self.wall3.position.x = 0.033
            self.wall4.position.x = 0.033
            self.wall5.position.x = 0.033
            self.wall6.position.x = 0.033
            self.wall1.position.x = 633.91
            self.wall2.position.x = 633.91
            self.wall3.position.x = 1152.919
            self.wall4.position.x = 1152.919
            self.wall5.position.x = 1671.928
            self.wall6.position.x = 1671.928
            self.userSprite.physicsBody?.affectedByGravity = false
            self.userSprite.position.y = -1.225
            self.userSprite.physicsBody?.pinned = false
            self.wall1.physicsBody?.pinned = false
            self.wall2.physicsBody?.pinned = false
            self.wall3.physicsBody?.pinned = false
            self.wall4.physicsBody?.pinned = false
            self.wall5.physicsBody?.pinned = false
            self.wall6.physicsBody?.pinned = false
            self.gameOver = false
            self.vc.gameOverLabel.isHidden = true
            self.vc.startLabel.text = "Tap to Start!"
            self.gameStarted = false
            self.score = 0
            
        }
        
        let noAction = UIAlertAction(title: "No", style: .destructive) {(alert) in
        
            self.vc.gameOver()
            self.wall1.position.x = 0.033
            self.wall2.position.x = 0.033
            self.wall3.position.x = 0.033
            self.wall4.position.x = 0.033
            self.wall5.position.x = 0.033
            self.wall6.position.x = 0.033
            self.wall1.position.x = 633.91
            self.wall2.position.x = 633.91
            self.wall3.position.x = 1152.919
            self.wall4.position.x = 1152.919
            self.wall5.position.x = 1671.928
            self.wall6.position.x = 1671.928
            self.userSprite.physicsBody?.affectedByGravity = false
            self.userSprite.position.y = -1.225
            self.userSprite.physicsBody?.pinned = false
            self.wall1.physicsBody?.pinned = false
            self.wall2.physicsBody?.pinned = false
            self.wall3.physicsBody?.pinned = false
            self.wall4.physicsBody?.pinned = false
            self.wall5.physicsBody?.pinned = false
            self.wall6.physicsBody?.pinned = false
            self.gameOver = false
            self.gameStarted = false
            self.score = 0
            
        }
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        
        self.vc.present(alert, animated: true, completion: nil)
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        if Int.random(in: 1...10) == 1 && !powerupSpawned {
            powerupSpawned = true
            // spawn a powerup based on rarity
        }
        
        if gameStarted {
            wall1.physicsBody?.velocity.dx = -500
            wall2.physicsBody?.velocity.dx = -500
            wall3.physicsBody?.velocity.dx = -500
            wall4.physicsBody?.velocity.dx = -500
            wall5.physicsBody?.velocity.dx = -500
            wall6.physicsBody?.velocity.dx = -500
            vc.updateScore()
        }
        
        if wall1.position.x > 600 {
            getPoints1 = true
        }
        if wall3.position.x > 600 {
            getPoints2 = true
        }
        if wall5.position.x > 600 {
            getPoints3 = true
        }
        
        if getPoints1 && wall1.position.x < -65 {
            score += 10
            getPoints1 = false
        }
        if getPoints2 && wall3.position.x < -65 {
            score += 10
            getPoints2 = false
        }
        if getPoints3 && wall5.position.x < -65 {
            score += 10
            getPoints3 = false
        }
        
        //edit wall positioning
        if wall1.position.x <= -700 && wall2.position.x <= -700{
            wall1.position.x = wall5.position.x + 519.009
            wall2.position.x = wall5.position.x + 519.009
//            wall1.size.height = CGFloat(Int.random(in: 150...275))
//            wall2.size.height = CGFloat(275 - wall1.size.height + 150)
//            wall2.position.y = -450 + wall2.size.height
        }
        if wall3.position.x <= -700 && wall4.position.x <= -700{
            wall3.position.x = wall1.position.x + 519.009
            wall4.position.x = wall1.position.x + 519.009
//            wall3.size.height = CGFloat(Int.random(in: 150...275))
//            wall4.size.height = CGFloat(275 - wall3.size.height + 150)
//            wall4.position.y = -450 + wall4.size.height
        }
        if wall5.position.x <= -700 && wall6.position.x <= -700{
            wall5.position.x = wall3.position.x + 519.009
            wall6.position.x = wall3.position.x + 519.009
//            wall5.size.height = CGFloat(Int.random(in: 150...275))
//            wall6.size.height = CGFloat(275 - wall5.size.height + 150)
//            wall6.position.y = -450 + wall6.size.height
        }
        
    }
    
}
