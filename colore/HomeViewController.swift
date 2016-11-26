/**
 *  HomeViewController
 *  - Controller for the Home View Layout.
 */

import UIKit
import QuartzCore
import SceneKit

class HomeViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /* 
     * When Help button is clicked, shows the alert dialog.
    */
    @IBAction func onHelpButtonClicked(sender: UIButton) {
        
        let alert = UIAlertController(
                    title: "Instructions",
                    message: "long string\nlong string\nlong string\nlong string\nlong string\nlong string\nlong string\nlong string\nlong string\nlong string\nlong string\nlong string\nlong string\nlong string\nlong string\nlong string\nlong string\nlong string\nlong string\nlong string\nlong string\nlong string\nlong string\nlong string\nlong string\nlong string\nlong string\nlong string\nlong string\nlong string\nlong string\nlong string\nlong string\nlong string\nlong string\nlong string\nlong string\nlong string\nlong string\nlong string\nlong string\nlong string\n",
                    preferredStyle: UIAlertControllerStyle.Alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in }
        
        alert.addAction(OKAction)
        
        presentViewController(alert, animated: true, completion: nil)
    }
}
