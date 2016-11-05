//
//  MasterModuel.swift
//  colore
//
//  Created by Anita Garcia on 9/24/16.
//  Copyright © 2016 sanc3823. All rights reserved.
//
import UIKit
import Foundation

class MasterModule{
    static let currentModule = MasterModule()
    private var _colors = [UIColor.yellowColor(), UIColor.orangeColor(), UIColor.redColor(),
                           UIColor.greenColor(), UIColor.blackColor(), UIColor.magentaColor(),
                           UIColor.cyanColor(), UIColor.blueColor(), UIColor.purpleColor()]
    
    static func getCurrentModule() -> MasterModule {
        return currentModule
    }
    
    internal func getNumOfColors() -> Int {
        return _colors.count
    }
    
    func getColorAt(index:Int) -> UIColor{
        return _colors[index];
    }
    
    private var _currentLevel: Int = 5
    var currentLevel: Int {
        get {
            return _currentLevel
        }
        set(updateLevel){
            if(updateLevel >= 1){
                _currentLevel = updateLevel
            }
        }
    }
    private var _currentPoints:Int = 0
    var currentPoints:Int {
        get {
            return _currentPoints
        }
        set(updatePoints){
            if(updatePoints >= 1){
                _currentPoints = updatePoints
            }
        }
    }
    
    private var _highestScore = 0
    var highestScore:Int {
        get {
            return _highestScore
        }
        set(updateScore){
            if(updateScore >= 1){
                _highestScore = updateScore
            }
        }
    }
}
