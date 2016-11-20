//
//  SequenceModule.swift
//  colore
//
//  Created by Anita Garcia on 10/1/16.
//  Copyright © 2016 Anita Garcia. All rights reserved.
//
import UIKit
import Foundation

class SequenceModule{
    private static let currentSequence = SequenceModule()
    private var colorSequence = [UIColor]()
    
    func insertColor(color:UIColor){
        colorSequence.append(color)
    }
    func removeHighestInSequence(){
        colorSequence.removeAtIndex(0)
    }
    func peakHighestInSequence() -> UIColor{
        return colorSequence[0]
    }
    func getColorSequence() -> [UIColor]{
        return colorSequence
    }
    
    func getSize() -> Int {
        return colorSequence.count
    }
    func printArray(){
        print(colorSequence)
    }
    func size() -> Int{
        return colorSequence.count
    }
    static func getCurrentModule() -> SequenceModule{
        return currentSequence
    }
    func getColorAt(index:Int) -> UIColor{
       return colorSequence[index]
    }
}

