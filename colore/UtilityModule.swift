/**
 *  Utility Module
 *
 *  This Module contains functions that can be shared
 *  and used by all classes in the application.
 */

import Foundation
class UtilityModule{
    private static let currentModule = UtilityModule()
    
    static func getRandomNumber(range:Int) -> Int{
        return Int(arc4random_uniform(UInt32(range)))
    }
    static func getRandomNumber() -> Int{
       return Int(random())
    }
    static func getCurrentModule() -> UtilityModule {
        return currentModule
    }
}