//
//  GameViewController.swift
//  colore
//
//  Created by Benito Sanchez on 9/17/16.
//  Copyright (c) 2016 sanc3823. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class HomeViewController: UIViewController{
    
    let inst1 = MasterModule.currentModule
    let inst2 = MasterModule.currentModule
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func updatePoints() {
        inst1.updatePoints()
        print(inst1.getCurrentPoints())
        inst2.updatePoints()
        print(inst1.getCurrentPoints())
    }
}
