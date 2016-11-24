
/*
 * GameOverViewController
 * Controller that displays the end game showing the high score and an image
*/

import UIKit

class GameOverViewController: UIViewController {

    
    @IBOutlet weak var lastLevelReachedLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highestScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayLastLevelReached()
        displayScore()
        displayHighestScore()
    }
    
    private func displayLastLevelReached() {
        lastLevelReachedLabel.text = lastLevelReachedLabel.text! + " \(MasterModule.getCurrentModule().currentLevel)"
    }
    
    private func displayScore() {
        scoreLabel.text = scoreLabel.text! + " \(MasterModule.getCurrentModule().currentPoints)"
    }
    
    private func displayHighestScore() {
        highestScoreLabel.text = highestScoreLabel.text! + " \(MasterModule.getCurrentModule().highestScore)"
    }
}
