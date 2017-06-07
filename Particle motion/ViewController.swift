//
//  ViewController.swift
//  Particle motion
//
//  Created by Bart Robat on 18/05/2017.
//  Copyright © 2017 Bart Robat. All rights reserved.
//

import Cocoa
import SpriteKit
import GameplayKit

class ViewController: NSViewController {

    
    @IBOutlet var skView: SKView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let scene = GKScene(fileNamed: "Scene") {

            let sceneNode = scene.rootNode as! Scene?

                sceneNode?.scaleMode = .aspectFill

                if let view = self.skView {
                    view.presentScene(sceneNode)
                    
                    view.ignoresSiblingOrder = true
                    
                    view.showsFPS = false
                    view.showsNodeCount = true
                
            }
        }
    }
}

