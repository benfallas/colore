/**
 - Board Cell
 - Contains a connection to the UIButton inside the cell
*/

import UIKit

class BoardCell: UICollectionViewCell {

    @IBOutlet weak var cellButton: UIButton!
    
    @IBAction func cellButtonClicked(sender: UIButton) {
        print(sender.backgroundColor!)
    }
}
