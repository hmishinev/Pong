import SpriteKit
import GameplayKit

class GameScene: SKScene {
  let ball = BallNode(name: NodeName.ball)
  let opponent = StickNode(name: NodeName.opponent)
  let player = StickNode(name: NodeName.player)

  override func didMove(to view: SKView) {
    setUpScenery(view: view)

    ball.physicsBody!.applyImpulse(CGVector(dx: 20, dy: 30))
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    for touch in touches {
      let location = touch.location(in: self)
      player.position.x = location.x
    }
  }

  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    for touch in touches {
      let location = touch.location(in: self)
      player.position.x = location.x
    }
  }

  override func update(_ currentTime: TimeInterval) {
    opponent.run(SKAction.moveTo(x: ball.position.x, duration: 0.1))
  }

  private func setUpScenery(view: SKView) {
    let frameBorder = SKPhysicsBody(edgeLoopFrom: frame)
    frameBorder.friction = 0
    frameBorder.restitution = 1
    physicsBody = frameBorder

    player.position = CGPoint(x: view.bounds.width * 0.5, y: view.bounds.height * 0.1)
    player.size = CGSize(width: view.bounds.width * 0.15, height: player.size.height)
    addChild(player)

    opponent.position = CGPoint(x: view.bounds.width * 0.5, y: view.bounds.height * 0.9)
    opponent.size = CGSize(width: view.bounds.width * 0.15, height: opponent.size.height)
    addChild(opponent)

    ball.position = CGPoint(x: view.bounds.width * 0.5, y: view.bounds.height * 0.5)
    ball.size = CGSize(width: view.bounds.width * 0.05, height: view.bounds.width * 0.05)
    addChild(ball)

    let leftWall = SKSpriteNode(color: UIColor.red, size: CGSize(width: 1, height: frame.height))
    leftWall.position = CGPoint(x: 0, y: view.bounds.height * 0.5)
    leftWall.physicsBody = SKPhysicsBody(rectangleOf: leftWall.size)
    leftWall.physicsBody!.isDynamic = false
    addChild(leftWall)

    let rightWall = SKSpriteNode(color: UIColor.green, size: CGSize(width: 1, height: frame.height))
    rightWall.position = CGPoint(x: view.bounds.maxX, y: frame.height * 0.5)
    rightWall.physicsBody = SKPhysicsBody(rectangleOf: rightWall.size)
    rightWall.physicsBody!.isDynamic = false
    addChild(rightWall)
  }
}
