/**
 *  BoardModel
 *
 *  This class is respoinsble for initializing the board with randomly
 *  placed colors on the 3 X 3 board game, and maintaining the
 *  board state as game is being played.
 **/

import Foundation
import UIKit

class BoardModel{
    
    struct Cell {
        var color: UIColor
        var numOfOccurences: Int
    }
    
    private var masterModule : MasterModule
    private var sequenceModule : SequenceModule
    private var utilityModule: UtilityModule
    private var board = [UIColor?]()
    private var stateOfBoard = [Cell?]()
    private let BOARD_SIZE = 9
    private var SEQUENCE_SIZE: Int
    
    internal init () {
        masterModule = MasterModule.getCurrentModule()
        sequenceModule = SequenceModule.getCurrentModule()
        SEQUENCE_SIZE = sequenceModule.size()
        utilityModule = UtilityModule.getCurrentModule()
        board = [UIColor?](count: BOARD_SIZE, repeatedValue: nil)
        stateOfBoard = [Cell?](count: SEQUENCE_SIZE, repeatedValue: nil)
    }
    
    func initBoard(){
        var color: UIColor
        var randomColor: UIColor
        var randomColorIndex: Int
        
        // Fill each color in once
        for i in 0..<(SEQUENCE_SIZE){
            var cellToFill:Int
            cellToFill = UtilityModule.getRandomNumber(BOARD_SIZE)
            // check to see if spot is empty
            while(board[cellToFill] != nil){
                cellToFill = UtilityModule.getRandomNumber(BOARD_SIZE)
            }
            color = sequenceModule.getColorAt(i)
            board[cellToFill] = color;
        }
        
        for _ in 0..<(BOARD_SIZE - SEQUENCE_SIZE) {
            // Get random index on 'board'
            var cellToFill:Int
            cellToFill = UtilityModule.getRandomNumber(BOARD_SIZE)
            // check to see if spot is empty
            while(board[cellToFill] != nil){
              cellToFill = UtilityModule.getRandomNumber(BOARD_SIZE)
            }
            // randomly get color from sequence (range 0, sizeOfSequence)
            randomColorIndex = UtilityModule.getRandomNumber(SEQUENCE_SIZE)
            randomColor = sequenceModule.getColorAt(randomColorIndex)
            board[cellToFill] = randomColor;
        }
    }
    
    func getBoard() -> [UIColor?]{
        return board
    }
}