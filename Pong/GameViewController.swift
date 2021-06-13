import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()

    if let scene = GKScene(fileNamed: "GameScene") {
      if let sceneNode = scene.rootNode as! GameScene? {

        sceneNode.scaleMode = .aspectFill

        if let view = self.view as! SKView? {
          view.presentScene(sceneNode)
          view.ignoresSiblingOrder = true
          view.showsFPS = true
          view.showsNodeCount = true
        }
      }
    }
  }

  override var shouldAutorotate: Bool { true }

  override var supportedInterfaceOrientations: UIInterfaceOrientationMask { .portrait }

  override var prefersStatusBarHidden: Bool { true }
}
