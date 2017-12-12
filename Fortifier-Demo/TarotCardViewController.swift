//
//  TarotCardViewController.swift
//  Fortifier-Demo
//
//  Created by Dennis Park on 12/04/17.
//  Copyright © 2017 NYU. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class TarotCardViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = tarotcardscene(size: CGSize(width: 1125, height: 2436))
        let skView = self.view as! SKView
        
        skView.ignoresSiblingOrder = false
        scene.scaleMode = .aspectFill
        skView.presentScene(scene)
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
}
