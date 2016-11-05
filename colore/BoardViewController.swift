//
//  BoardViewController.swift
//  colore
//
//  Created by Benito Sanchez on 11/5/16.
//  Copyright © 2016 Anita Garcia. All rights reserved.
//

import UIKit

class BoardViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showButton()
    }
    
    func showButton() {
    
        for item in self.collectionView!.visibleCells() as! [BoardCell] {
    
            let indexpath : NSIndexPath = self.collectionView!.indexPathForCell(item as BoardCell)!
            let cell : BoardCell = self.collectionView!.cellForItemAtIndexPath(indexpath) as! BoardCell
    
    
            //Close Button
            let close : UIButton = cell.viewWithTag(102) as! UIButton
            close.hidden = false
        }
    }

    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView?) -> Int {
        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView?, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {

        
        let cell : BoardCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! BoardCell

        
        cell.cellButton?.hidden = false
        cell.cellButton?.backgroundColor = UIColor.blueColor()
        return cell
    }


}
