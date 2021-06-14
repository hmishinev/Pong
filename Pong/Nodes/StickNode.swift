import SpriteKit

class StickNode: SKSpriteNode {
  init(name: String) {
    super.init(texture: nil, color: .white, size: CGSize(width: 120, height: 10))

    self.name = name

    physicsBody = SKPhysicsBody(rectangleOf: size)
    if let body = physicsBody {
      body.isDynamic = false
      body.allowsRotation = false
      body.affectedByGravity = false
      body.categoryBitMask = PhysicsCategory.stick
      body.collisionBitMask = PhysicsCategory.ball
      body.contactTestBitMask = PhysicsCategory.ball
    }
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
