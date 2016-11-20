/**
  - BoardViewController
  - Controller that creates the boardgame layout buttons
**/

import UIKit

class BoardViewController: UICollectionViewController {

    private var sequenceModule : SequenceModule!
    var boardModel = BoardModel()
    var buttonIndex : Int = 0;
    var board : [UIColor?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sequenceModule = SequenceModule.getCurrentModule()
        // Initialize board
        boardModel.initBoard()
        board = boardModel.getBoard()
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView?) -> Int {
        return 1
    }
    
    /**
    - Returns the number of buttons to be created.
    */
    override func collectionView(
        collectionView: UICollectionView?,
        numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func randomColor(size : Int) -> Int {
        return Int(arc4random_uniform(UInt32(size)))
    }
    
    /**
     - sets each buttons background color.
    */
    override func collectionView(
        collectionView: UICollectionView,
        cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell : BoardCell = collectionView.dequeueReusableCellWithReuseIdentifier(
            "Cell",
            forIndexPath: indexPath) as! BoardCell
        
        cell.cellButton?.backgroundColor = board[buttonIndex]
        cell.cellButton?.layer.borderColor = UIColor.blackColor().CGColor
        cell.cellButton?.layer.borderWidth = 1
        
        buttonIndex += 1;
        
        return cell
    }

    
    func collectionView(collectionView: UICollectionView,
                                   layout collectionViewLayout: UICollectionViewLayout,
                                          sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = (1.0) * screenSize.width * (1.0/3.0)
        let screenHeight = (1.0) * screenSize.height * (1.0/3.0)
        
        return CGSize(width: screenWidth, height: screenHeight)
    }
    
    func collectionView(collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                               minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
}
