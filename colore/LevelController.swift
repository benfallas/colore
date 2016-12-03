
/**
 *  LevelController
 *
 *  - Selects random colors from the list of colors that can be found in MasterModule.
 *  - Displays a button with selected colors background
 *  - Keeps track of buttons x, y axis on the screen to add the next button
 *  - Logic to center buttons.
 */
import UIKit

class LevelController: UIViewController {
    
    private var randomlySelectedColors : [UIColor] = []
    private var levelModelViewController = LevelController.self
    private var masterModule : MasterModule!
    var totalSecondsCountDown = 3 // 60 seconds
    var timer : NSTimer!
    
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var mTimer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /**
         * Grand Central Dispatch that takes care of multithreading.
         * Other thread will handle populating level sequence list. 
         */
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        dispatch_async(dispatch_get_global_queue(priority, 0)) {
            self.masterModule = MasterModule.getCurrentModule()
            let modelViewController = LevelModel()
            
            self.levelLabel.text = "Level: \(self.masterModule.currentLevel)"
            
            self.randomlySelectedColors = modelViewController.getRandomlySelectedColors()
            dispatch_async(dispatch_get_main_queue()) {
                self.displaySequenceColors();
            }
        }
        
        self.startCountDownTimer()
    }
    
    
    /**
        Display the colors in randomlySelectedColors on Level Screen
        
        Colors to display is the level + 2.
    */
    func displaySequenceColors() {
        
        let buttonHeight = 60;
        let buttonWidth = 300;
        
        let numOfButtons = masterModule.currentLevel + 2;
        var buttonTop = view.bounds.height / 10 + 10
        
        /**
        * For each button in this level: 
        *   - Create a button
        *   - set buttons background
        *   - Add button to the view
        *   - Update buttonTop to remember where to place next button.
        */
        for x in 0..<numOfButtons {

            let button = UIButton(frame: CGRect(x: 0, y: 0, width: buttonWidth, height: buttonHeight))
            button.center = CGPoint(x: view.bounds.width / 2, y: buttonTop)
            
            button.backgroundColor = randomlySelectedColors[x]
            
            view.addSubview(button)
            buttonTop = buttonTop + CGFloat(buttonHeight + 5)
        }
    }
    
    /**
    * Updates timer on the view.
    */
    func updateTimer() {
        
        if self.totalSecondsCountDown > 0 {
            self.totalSecondsCountDown = self.totalSecondsCountDown - 1
            mTimer.text = String(self.totalSecondsCountDown)
        } else {
            self.stopCountDownTimer();
            mTimer.text = String(self.totalSecondsCountDown)
            performSegueWithIdentifier("PlayButton", sender: self)
        }
    }
    
    /**
    * When button is clicked. 
    * Stop timer. 
    */
    @IBAction func onPlayButtonClicked() {
        self.totalSecondsCountDown = 0
        updateTimer()
    }
    
    /**
    * Starts timer count down.
    */
    func startCountDownTimer() {
        
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
        }
        
        if self.totalSecondsCountDown > 0 {
            self.timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(LevelController.updateTimer), userInfo: nil, repeats: true)
            NSRunLoop.currentRunLoop().addTimer(self.timer, forMode: NSRunLoopCommonModes)
            self.timer.fire()
        }
    }
    
    /**
    * Stops timer count down.
    */
    func stopCountDownTimer() {
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
        }
    }
}
