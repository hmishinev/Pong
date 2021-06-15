import SpriteKit
import GameplayKit

class GameScene: SKScene {
  let ball = BallNode(name: NodeName.ball)
  let opponent = StickNode(name: NodeName.opponent)
  let player = StickNode(name: NodeName.player)
  var topWall: SKSpriteNode!
  var bottomWall: SKSpriteNode!

  var scorePlayer = 0
  var scoreOpponent = 0

  override func didMove(to view: SKView) {
    setUpScenery(view: view)

    physicsWorld.contactDelegate = self
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

    topWall = SKSpriteNode(color: .green, size: CGSize(width: view.bounds.width, height: 5))
    topWall.name = NodeName.topWall
    topWall.position = CGPoint(x: view.bounds.width * 0.5, y: 0)
    topWall.physicsBody = SKPhysicsBody(rectangleOf: topWall.size)
    topWall.physicsBody!.isDynamic = false
    if let body = topWall.physicsBody {
      body.categoryBitMask = PhysicsCategory.topWall
      body.collisionBitMask = PhysicsCategory.ball
      body.contactTestBitMask = PhysicsCategory.ball
    }
    addChild(topWall)

    bottomWall = SKSpriteNode(color: .yellow, size: CGSize(width: view.bounds.width, height: 5))
    bottomWall.name = NodeName.bottomWall
    bottomWall.position = CGPoint(x: view.bounds.width * 0.5, y: view.bounds.height)
    bottomWall.physicsBody = SKPhysicsBody(rectangleOf: bottomWall.size)
    bottomWall.physicsBody!.isDynamic = false
    if let body = bottomWall.physicsBody {
      body.categoryBitMask = PhysicsCategory.bottomWall
      body.collisionBitMask = PhysicsCategory.ball
      body.contactTestBitMask = PhysicsCategory.ball
    }
    addChild(bottomWall)

    let leftWall = SKSpriteNode(color: .red, size: CGSize(width: 1, height: frame.height))
    leftWall.position = CGPoint(x: 0, y: view.bounds.height * 0.5)
    leftWall.physicsBody = SKPhysicsBody(rectangleOf: leftWall.size)
    leftWall.physicsBody!.isDynamic = false
    addChild(leftWall)

    let rightWall = SKSpriteNode(color: .red, size: CGSize(width: 1, height: frame.height))
    rightWall.position = CGPoint(x: view.bounds.maxX, y: frame.height * 0.5)
    rightWall.physicsBody = SKPhysicsBody(rectangleOf: rightWall.size)
    rightWall.physicsBody!.isDynamic = false
    addChild(rightWall)
  }
}

extension GameScene: SKPhysicsContactDelegate {
  func didBegin(_ contact: SKPhysicsContact) {
    let collision = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask

    if collision == PhysicsCategory.ball | PhysicsCategory.topWall {
      let body = contact.bodyA.categoryBitMask == PhysicsCategory.topWall ? contact.bodyA.node : contact.bodyB.node
      if body?.name == NodeName.topWall {
        scoreOpponent += 1
      }
    }

    if collision == PhysicsCategory.ball | PhysicsCategory.bottomWall {
      let body = contact.bodyA.categoryBitMask == PhysicsCategory.bottomWall ? contact.bodyA.node : contact.bodyB.node
      if body?.name == NodeName.bottomWall {
        scorePlayer += 1
      }
    }

    print("Player \(scorePlayer) : \(scoreOpponent) Opponent")
  }
}
