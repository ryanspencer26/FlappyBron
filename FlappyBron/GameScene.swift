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
    private var spinnyNode : SKShapeNode?
    public var vc : UIViewController!
    public var gameStarted = false
    public var gameOver = false
    
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
        userSprite.physicsBody?.velocity.dx = 0
        userSprite.physicsBody?.velocity.dy = 0
        wall1.physicsBody?.pinned = true
        wall2.physicsBody?.pinned = true
        wall3.physicsBody?.pinned = true
        wall4.physicsBody?.pinned = true
        wall5.physicsBody?.pinned = true
        wall6.physicsBody?.pinned = true
        gameOver = true
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        //edit wall positioning
        if wall1.position.x <= -700 && wall2.position.x <= -700{
            wall1.position.x = 700
            wall2.position.x = 700
            wall1.physicsBody?.velocity.dx = -500
            wall2.physicsBody?.velocity.dx = -500
        }
        if wall3.position.x <= -700 && wall4.position.x <= -700{
            wall3.position.x = 700
            wall4.position.x = 700
            wall3.physicsBody?.velocity.dx = -500
            wall4.physicsBody?.velocity.dx = -500
        }
        if wall5.position.x <= -700 && wall6.position.x <= -700{
            wall5.position.x = 700
            wall6.position.x = 700
            wall5.physicsBody?.velocity.dx = -500
            wall6.physicsBody?.velocity.dx = -500
        }
        
    }
    
}
