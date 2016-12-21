/**
 *  HomeViewController
 *  - Controller for the Home View Layout.
 */

import UIKit
import QuartzCore
import SceneKit

class HomeViewController: UIViewController{
    
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
    }
    
    /** Adds animation to home label and buttons **/
    override func viewDidAppear(animated: Bool) {
        /** Adds animation to the 'colore' home label **/
        UIView.animateWithDuration(2.0, animations: {
            self.homeLabel.center.y += self.view.bounds.width
        })
        
        /** Adds animation to the play and help buttons **/
        UIView.animateWithDuration(1.0, delay: 1.0,
                                   options: [],
                                   animations: {
                                    self.playButton.alpha = 1.0
                                    self.playButton.layer.backgroundColor = UIColor.blackColor().CGColor
                                    self.playButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)

                                    self.helpButton.alpha = 1.0
                                    self.helpButton.layer.backgroundColor = UIColor.blackColor().CGColor

                                self.helpButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            }, completion: nil)
    }
    
    /** This will make the view invisible when the view appears **/
    override func viewWillAppear(animated: Bool) {
        homeLabel.center.y -= view.bounds.width
        playButton.alpha = 0.0
        helpButton.alpha = 0.0
    }
    
    /** When Help button is clicked, shows the alert dialog. **/
    @IBAction func onHelpButtonClicked(sender: UIButton) {
        
        let alert = UIAlertController(
                    title: "Instructions",
                    message: getOverView() + getNewGame() + getLevelInstructions() + getBoardInstructions() + getGameOver(),
                    preferredStyle: UIAlertControllerStyle.Alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in }
        
        alert.addAction(OKAction)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    private func setBackground() {
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "colore_background")?.drawInRect(self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
    }
    
    private func getOverView() -> String {
        let title = "Overview: \n\n"
        
        let body = "Colore is a game that is meant to stimulate the brain of the player by training the user's brain to remember colors! The main logic is to remember colors and click on the colors in the order that they were seen!!\n\n"
        
        let overView = title + body
        return overView
    }
    
    private func getNewGame() -> String {
        let title = "Creating a new Game: \n\n"
        let body = "On the initial screen click on 'New Game' button!\n\n"

        let newGame = title + body
    
        return newGame
    }
    
    private func getLevelInstructions() -> String {
        
        let title = "Level Screen: \n\n "
        let body = "Once at the level screen, the player will view a list of colors. REMEMBER THE ORDER!! For example: Blue, Green, Red.\n\n"
        
        let levelInstructions = title + body
        
        return levelInstructions;
    }
    
    private func getBoardInstructions() -> String {
        let title = "Board Screen: \n\n"
        let body = "The Board Screen consists of a 3X3 board full of colors!! The colors are mixture of all the colors listed in the Level screen!! The players goal is to click on the colors in the order that they were displayed! Given the previous example with the list 'Blue, Green, Red' the goal would be to click all Blue buttons, then proceed with all Green button and finally all Red buttons!\n\n"
        
        let boardInstructions = title + body;
        
        return boardInstructions;
    }
    
    private func getGameOver() -> String {
        let title = "Game Over: \n\n"
        
        let body = "If the color clicked on in the Board Screen is not the next color in the sequence, the Game Over screen will be displayed. The Game Over screen will show the players level reached, current score, highest score. \n\n"
        
        let gameOver = title + body;
        
        return gameOver
    }
}
