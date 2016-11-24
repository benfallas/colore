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
        
        mutating func decrement(){
            self.numOfOccurences -= 1;
        }
    }
    
    private var masterModule : MasterModule
    private var sequenceModule : SequenceModule
    private var utilityModule: UtilityModule
    private var board = [UIColor?]()
    private var state = [UIColor: Int]()
    private let BOARD_SIZE = 9
    private var SEQUENCE_SIZE: Int
    
    internal init () {
        masterModule = MasterModule.getCurrentModule()
        sequenceModule = SequenceModule.getCurrentModule()
        SEQUENCE_SIZE = sequenceModule.size()
        utilityModule = UtilityModule.getCurrentModule()
        board = [UIColor?](count: BOARD_SIZE, repeatedValue: nil)
        initBoard()
    }
    
    func getBoardSize() -> Int{
        return BOARD_SIZE;
    }
    
    func getBoard() -> [UIColor?]{
        return board
    }
    
    func getState() -> [UIColor: Int]{
        return state;
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
            state[color] = 1;
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
            state[randomColor] = state[randomColor]! + 1;
        }
    }
    
    /** 
     - Updated state of board. It decrease the number of occurences
     - or remove highest in sequence when there are no more 
     - occurences of that color on the board.
    */
    func updateStateBoard(color: UIColor){
        state[color] = state[color]! - 1;
        if(state[color] == 0){
            state[color] = nil
            sequenceModule.removeHighestInSequence()
        }
    }
    
    /**
    - Increases points upon successful click
    */
    func increasePoints(){
        masterModule.currentPoints += 1;
    }
    
    /**
    - Checks to see if level is complete
    */
    func isLevelOver() -> Bool{
        if(sequenceModule.size() == 0){
            return true;
        }
        return false;
    }
    
    /**
    - Check to see if game is over
    */
    func isGameOver() -> Bool {
        return masterModule.currentLevel == 7;
    }
    
    /**
    - Increases current level
    */
    func increaseLevel(){
        masterModule.currentLevel += 1;
    }
    
    /**
     - Clears state and board
     */
    func clear(){
        board.removeAll()
        state.removeAll()
    }
}