//
//  GameScene.swift
//  FlappyBron
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var userSprite : SKSpriteNode!
    var wall1: SKSpriteNode!
    var wall2: SKSpriteNode!
    var wall3: SKSpriteNode!
    var wall4: SKSpriteNode!
    var wall5: SKSpriteNode!
    var wall6: SKSpriteNode!
    let cam = SKCameraNode()
    private var label : SKLabelNode?
    public var vc : GameViewController!
    public var gameStarted = false
    public var gameOver = false
    public var score = 0
    public var getPoints1 = true
    public var getPoints2 = true
    public var getPoints3 = true
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        userSprite = self.childNode(withName: "user") as! SKSpriteNode
        wall1 = self.childNode(withName: "wall1") as! SKSpriteNode
        wall2 = self.childNode(withName: "wall2") as! SKSpriteNode
        wall3 = self.childNode(withName: "wall3") as! SKSpriteNode
        wall4 = self.childNode(withName: "wall4") as! SKSpriteNode
        wall5 = self.childNode(withName: "wall5") as! SKSpriteNode
        wall6 = self.childNode(withName: "wall6") as! SKSpriteNode
        userSprite.texture = SKTexture(image: UIImage.bronSprite)
        self.camera = cam
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
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        if gameStarted {
            wall1.physicsBody?.velocity.dx = -500
            wall2.physicsBody?.velocity.dx = -500
            wall3.physicsBody?.velocity.dx = -500
            wall4.physicsBody?.velocity.dx = -500
            wall5.physicsBody?.velocity.dx = -500
            wall6.physicsBody?.velocity.dx = -500
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
        
        vc.updateScore()
        
        //edit wall positioning
        if wall1.position.x <= -700 && wall2.position.x <= -700{
            wall1.position.x = wall5.position.x + 519.009
            wall2.position.x = wall5.position.x + 519.009
            wall1.size.height = CGFloat(Int.random(in: 215...275))
            wall2.size.height = CGFloat(Int.random(in: 215...275))
            wall2.position.y = -425 + wall2.size.height
        }
        if wall3.position.x <= -700 && wall4.position.x <= -700{
            wall3.position.x = wall1.position.x + 519.009
            wall4.position.x = wall1.position.x + 519.009
            wall3.size.height = CGFloat(Int.random(in: 215...275))
            wall4.size.height = CGFloat(Int.random(in: 215...275))
            wall4.position.y = -425 + wall4.size.height
        }
        if wall5.position.x <= -700 && wall6.position.x <= -700{
            wall5.position.x = wall3.position.x + 519.009
            wall6.position.x = wall3.position.x + 519.009
            wall5.size.height = CGFloat(Int.random(in: 215...275))
            wall6.size.height = CGFloat(Int.random(in: 215...275))
            wall6.position.y = -425 + wall6.size.height
        }
        
    }
    
}
