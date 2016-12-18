
/*
 * GameOverViewController
 * Controller that displays the end game showing the high score and an image
*/

import UIKit

class GameOverViewController: UIViewController {

    private var masterModule : MasterModule!
    var isWinner: Bool!
    @IBOutlet weak var lastLevelReachedLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highestScoreLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if((isWinner) != nil) {
            let boolean: Bool = isWinner
            if(boolean) {
                imageView.image = UIImage(named: "checkmark_image.png")
            } else {
                imageView.image = UIImage(named: "x_image.png")
            }
        }
        masterModule = MasterModule.getCurrentModule()
        displayLastLevelReached()
        displayScore()
        displayHighestScore()
        
    }
    
    private func displayLastLevelReached() {
        lastLevelReachedLabel.text = lastLevelReachedLabel.text! + " \(MasterModule.getCurrentModule().currentLevel)"
    }
    
    private func displayScore() {
        scoreLabel.text = scoreLabel.text! + " \(masterModule.currentPoints)"
    }
    
    private func displayHighestScore() {
        highestScoreLabel.text = highestScoreLabel.text! + " \(masterModule.highestScore)"
    }
}
