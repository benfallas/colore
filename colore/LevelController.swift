
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
    var totalSecondsCountDown = 0
    var timer : NSTimer!
    var BASE_TIME = 5
    var CURRENT_LEVEL = 0
    
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var mTimer: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.masterModule = MasterModule.getCurrentModule()
        CURRENT_LEVEL = masterModule.currentLevel
        
        self.playButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.playButton.backgroundColor = UIColor.blackColor()
        setTimer()

        /**
         * Grand Central Dispatch that takes care of multithreading.
         * Other thread will handle populating level sequence list. 
         */
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        dispatch_async(dispatch_get_global_queue(priority, 0)) {
            let modelViewController = LevelModel()
            
            self.levelLabel.text = "Level: \(self.CURRENT_LEVEL)"
            
            self.randomlySelectedColors = modelViewController.getRandomlySelectedColors()
            dispatch_async(dispatch_get_main_queue()) {
                self.displaySequenceColors();
            }
        }
        self.startCountDownTimer()
    }
    
    /**
     * Sets the total time to count down.
     */
    func setTimer(){
        if(CURRENT_LEVEL <= 2){
            totalSecondsCountDown = BASE_TIME + (CURRENT_LEVEL - 1)
        }
        else{
            totalSecondsCountDown = BASE_TIME + (CURRENT_LEVEL - 1) + Int(log2(Double(CURRENT_LEVEL - 1))) + Int(log2(Double(CURRENT_LEVEL - 2)));
        }
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
