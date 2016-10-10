//
//  LevelViewController.swift
//  colore
//
//  Created by Benito Sanchez on 10/1/16.
//  Copyright © 2016 Anita Garcia. All rights reserved.
//

import UIKit

class LevelViewController: UIViewController {
    
    var randomlySelectedColors : [UIColor] = []
    
    var levelModelViewController = LevelViewController.self
    
    var levelTracker = LevelTracker()
    
    
    @IBOutlet weak var levelLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let modelViewController = LevelModelViewController()
        
        levelLabel.text = "Level: \(levelTracker.getCurrentLevel())"
        
        randomlySelectedColors = modelViewController.getRandomlySelectedColors()
        
        displaySequenceColors();
    }
    
    
    // Displays a
    func displaySequenceColors() {
        let buttonHeight = 60;
        let buttonWidth = 300;
        let numOfButtons = levelTracker.getCurrentLevel() + 1;
        var buttonTop = view.bounds.height / 10 + 10
        
        for x in 0...numOfButtons {

            let button = UIButton(frame: CGRect(x: 0, y: 0, width: buttonWidth, height: buttonHeight))
            button.center = CGPoint(x: view.bounds.width / 2, y: buttonTop)
            
            button.backgroundColor = randomlySelectedColors[x]
            
            view.addSubview(button)
            buttonTop = buttonTop + CGFloat(buttonHeight + 5)
        }
    }
}
