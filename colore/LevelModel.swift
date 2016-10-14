/**
*   LevelModel
*
*   -  Logic to generate random unique colors from a list of colors.
*   -  Keeps track of selected colors.
*   -  Functionality to return the list of randomly generated colors.
*   -  Inserts generated colors into sequence module.
*/

import UIKit

class LevelModel {
    
    private var selectedColors : [UIColor]
    private var masterModule : MasterModule
    private var sequenceModule : SequenceModule
    
    internal init () {
        masterModule = MasterModule.getCurrentModule()
        sequenceModule = SequenceModule.currentSequence
        
        selectedColors = []
        randomlySelectColor()
    }

    /**
    *   Returns a list of the randomly selected colors
    */
    internal func getRandomlySelectedColors() -> [UIColor]{
        return selectedColors
    }
    
    /**
    *   Selects random, unique colors from the list of colors provided in MasterModule.
    *   Inserts generated color into sequence module.
    */
    private func randomlySelectColor() {
        
        var randomColor : UIColor
        
        for _ in 0..<masterModule.currentLevel + 2 {
            repeat {
                randomColor = getRandomColor()
                print(randomColor)
            } while (selectedColors.contains(randomColor))
            selectedColors.append(randomColor)
            sequenceModule.insertColor(randomColor)
        }
    }
    
    // Returns a random color from master module's list of colors
    private func getRandomColor() -> UIColor {
        return masterModule.getColorAt(Int(arc4random_uniform(UInt32(masterModule.getNumOfColors()))));
    }
}
