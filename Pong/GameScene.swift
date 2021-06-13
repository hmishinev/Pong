import SpriteKit
import GameplayKit

class GameScene: SKScene {
  var ball: SKSpriteNode!
  var opponent: SKSpriteNode!
  var player: SKSpriteNode!

  override func didMove(to view: SKView) {
    ball = childNode(withName: "BallNode") as? SKSpriteNode
    opponent = childNode(withName: "OpponentNode") as? SKSpriteNode
    player = childNode(withName: "PlayerNode") as? SKSpriteNode

    let frameBorder = SKPhysicsBody(edgeLoopFrom: frame)
    frameBorder.friction = 0
    frameBorder.restitution = 1
    physicsBody = frameBorder

    ball.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20))
  }

  override func update(_ currentTime: TimeInterval) {
  }
}
