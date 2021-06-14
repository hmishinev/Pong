import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
  private var scene: GameScene!

  override func viewDidLoad() {
    super.viewDidLoad()

    let view = view as! SKView
    view.isMultipleTouchEnabled = false

    scene = GameScene(size: view.bounds.size)

    view.presentScene(scene)
  }

  override var shouldAutorotate: Bool { true }
  override var supportedInterfaceOrientations: UIInterfaceOrientationMask { .portrait }
  override var prefersStatusBarHidden: Bool { true }
}
