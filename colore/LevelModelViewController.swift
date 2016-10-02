//
//  LevelModelViewController.swift
//  colore
//
//  Created by Benito Sanchez on 10/1/16.
//  Copyright © 2016 Anita Garcia. All rights reserved.
//

import UIKit

class LevelModelViewController {
    
    // FOR TESTING PURPOSE
    private var _colors = [UIColor.yellowColor(), UIColor.orangeColor(), UIColor.redColor(),
                           UIColor.greenColor(), UIColor.blackColor(), UIColor.magentaColor(),
                           UIColor.cyanColor(), UIColor.blueColor(), UIColor.purpleColor()]
    
    private var selectedColors : [UIColor]
    var levelTracker : LevelTracker;
    
    internal init () {
        selectedColors = []
        levelTracker = LevelTracker()
        randomlySelectColor()
    }

    internal func getRandomlySelectedColors() -> [UIColor]{
        return selectedColors
    }
    
    // ===============================================================================================
    // randomly selects UIColors from a container of different UIColors
    // All selected colors are unique
    // ===============================================================================================
    private func randomlySelectColor() {
        
        var randomColor : UIColor
        
        for _ in 0..<getNumColors() {
            repeat {
                randomColor = getRandomNumberFromColors()
                print(randomColor)
            } while (selectedColors.contains(randomColor))
            selectedColors.append(randomColor)
        }
        
    }
    
    // Returns a randomly color from a container of colors
    private func getRandomNumberFromColors() -> UIColor {
        return _colors[Int(arc4random_uniform(UInt32(_colors.count)))]
    }
    
    private func getNumColors() -> Int {
        return getLevel() + 2;
    }
    
    // returns level
    private func getLevel() -> Int {
        return levelTracker.getCurrentLevel()
    }

}
