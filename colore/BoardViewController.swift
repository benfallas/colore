/**
  - BoardViewController
  - Controller that creates the boardgame layout buttons
**/

import UIKit

class BoardViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    /**
     - sets each buttons background color.
    */
    override func collectionView(
        collectionView: UICollectionView,
        cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell : BoardCell = collectionView.dequeueReusableCellWithReuseIdentifier(
            "Cell",
            forIndexPath: indexPath) as! BoardCell

        cell.cellButton?.backgroundColor = UIColor.blueColor()
        return cell
    }
}
