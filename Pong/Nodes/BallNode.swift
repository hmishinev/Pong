import SpriteKit

class BallNode: SKSpriteNode {
  init(name: String) {
    let texture = SKTexture(imageNamed: ImageName.ball)
    super.init(texture: texture, color: .white, size: texture.size())

    self.name = name

    physicsBody = SKPhysicsBody(rectangleOf: size)
    if let body = physicsBody {
      body.isDynamic = true
      body.allowsRotation = true
      body.affectedByGravity = false
      body.categoryBitMask = PhysicsCategory.ball
      body.collisionBitMask = PhysicsCategory.stick
      body.contactTestBitMask = PhysicsCategory.stick
      body.linearDamping = 0
      body.angularDamping = 0
      body.friction = 0
      body.restitution = 0.9
      body.mass = 0.035
      body.density = 0.7
    }
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
