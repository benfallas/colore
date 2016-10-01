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
    
   /* var colors = [UIColor.yellowColor(), UIColor.orange, UIColor.red,
                           UIColor.green, UIColor.black, UIColor.magenta,
                           UIColor.cyan, UIColor.blue, UIColor.purple]*/
    var currentLevel = 1
    var currentPoints = 0
    var highestScore = 0
    
    
    static func getCurrentModule() -> MasterModule{
        return currentModule
    }
    
    func updatePoints(){
        currentPoints+=1
    }
    func getCurrentPoints() -> Int{
        return currentPoints
    }
}
//let _MasterModuleInstance = MasterModule()
