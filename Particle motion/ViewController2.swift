//
//  ViewController2.swift
//  Particle motion
//
//  Created by Bart Robat on 21/05/2017.
//  Copyright © 2017 Bart Robat. All rights reserved.
//

import Cocoa
import SpriteKit
import GameplayKit

class ViewController2: NSViewController {

    
    @IBOutlet var skView: SKView!
    


    override func viewDidLoad() {
        super.viewDidLoad()

        if let scene = GKScene(fileNamed: "Euler") {

            let sceneNode = scene.rootNode as! Euler?

            sceneNode?.scaleMode = .aspectFill

            if let view = self.skView {
                view.presentScene(sceneNode)
                
                view.ignoresSiblingOrder = true
                
                view.showsFPS = true
                view.showsNodeCount = true
                
            }
        }
    }

    
}
