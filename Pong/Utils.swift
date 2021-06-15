enum NodeName {
  static let ball = "Ball"
  static let player = "Player"
  static let opponent = "Opponent"
  static let topWall = "TopWall"
  static let bottomWall = "BottomWall"
}

enum ImageName {
  static let ball = "Ball"
}

enum PhysicsCategory {
  static let none: UInt32 = 0
  static let stick: UInt32 = 2
  static let ball: UInt32 = 4
  static let topWall: UInt32 = 6
  static let bottomWall: UInt32 = 8
}
