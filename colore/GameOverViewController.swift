
/*
 * GameOverViewController
 * Controller that displays the end game showing the high score and an image
*/

import UIKit

class GameOverViewController: UIViewController {

    private var masterModule : MasterModule!
    @IBOutlet weak var lastLevelReachedLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highestScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
