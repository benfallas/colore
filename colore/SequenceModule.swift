/**
 - SequenceModule
 - Keeps track of the current level's color sequence
 **/
import UIKit
import Foundation

class SequenceModule{
    private static let currentSequence = SequenceModule()
    private var colorSequence = [UIColor]()
    
    /**
     - Insert color into sequence
     */
    func insertColor(color:UIColor){
        colorSequence.append(color)
    }
    
    /**
     - Removed the first element in sequence
     */
    func removeHighestInSequence(){
        colorSequence.removeAtIndex(0)
    }
    
    /**
     - Returns the first element in sequence
     */
    func peakHighestInSequence() -> UIColor{
        return colorSequence[0]
    }
    
    /**
     - Returns color sequence
     */
    func getColorSequence() -> [UIColor]{
        return colorSequence
    }
    
    /**
     - Returns the size of the sequence
     */
    func size() -> Int{
        return colorSequence.count
    }

    /**
     - Returns a color from a specific index
     */
    func getColorAt(index:Int) -> UIColor{
       return colorSequence[index]
    }
    
    /**
     - Clears the color sequence 
     */
    func clear(){
        colorSequence.removeAll()
    }
    
    /**
     - Returns instance
     */
    static func getCurrentModule() -> SequenceModule{
        return currentSequence
    }
}

