/**
  - BoardViewController
  - Controller that creates the boardgame layout buttons
**/

import UIKit

class BoardViewController: UICollectionViewController {

    private var sequenceModule : SequenceModule!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sequenceModule = SequenceModule.currentSequence
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
        
        cell.cellButton?.backgroundColor = sequenceModule.getColorSequence()[randomColor(sequenceModule.getSize())]
        return cell
    }

}
