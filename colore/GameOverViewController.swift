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
        masterModule = MasterModule.getCurrentModule()
        displayIsWinnerImage()
        displayLastLevelReached()
        displayScore()
        displayHighestScore()
        setBackground()
    }
    
    private func displayIsWinnerImage() {
        imageView.contentMode = .ScaleAspectFit
        if((isWinner) != nil) {
            let boolean: Bool = isWinner
            if(boolean) {
                imageView.image = UIImage(named: "win")
            } else {
                imageView.image = UIImage(named: "loose")
            }
            UIGraphicsBeginImageContextWithOptions((imageView.image?.size)!, true, 0.0)
        }
    }
    
    private func setBackground() {
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "colore_background")?.drawInRect(self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
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
