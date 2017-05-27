//
//  MenuView.swift
//  Particle motion
//
//  Created by Bart Robat on 21/05/2017.
//  Copyright © 2017 Bart Robat. All rights reserved.
//

import Cocoa


//klasa odpowiadająca za menu programu. Odbiera dane z okienek tekstowych i przekazuje je dalej

public class MenuView: NSViewController {

    
    @IBOutlet public var bx: NSTextField!
    @IBOutlet public var by: NSTextField!
    @IBOutlet public var bz: NSTextField!
    
    @IBOutlet var vx: NSTextField!
    @IBOutlet var vy: NSTextField!
    @IBOutlet var vz: NSTextField!
    
    @IBOutlet var x: NSTextField!
    @IBOutlet var y: NSTextField!
    @IBOutlet var z: NSTextField!
    
    @IBOutlet var q: NSTextField!
    @IBOutlet var k: NSTextField!
    @IBOutlet var m: NSTextField!
    @IBOutlet var c: NSTextField!
    
    @IBOutlet var duration: NSTextField!
    @IBOutlet var timeStep: NSTextField!
    

    @IBAction func electron(_ sender: NSButton) {
        
        q.doubleValue = -1.602e-19
        k.doubleValue = 1.0
        m.doubleValue = 9.109e-31
        c.doubleValue = 299792458

    }
    
    @IBAction func proton(_ sender: NSButton) {
        
        q.doubleValue = 1.602e-19
        k.doubleValue = 1.0
        m.doubleValue = 1.672e-27
        c.doubleValue = 299792458

    }
    

    @IBAction func calculate(_ sender: NSButton) {
        
        Const.Bx = bx.doubleValue
        Const.By = by.doubleValue
        Const.Bz = bz.doubleValue
        
        Const.Vx = vx.doubleValue
        Const.Vy = vy.doubleValue
        Const.Vz = vz.doubleValue
        
        Const.x = x.doubleValue
        Const.y = y.doubleValue
        Const.z = z.doubleValue
        
        Const.q = q.doubleValue
        Const.k = k.doubleValue
        Const.m = m.doubleValue
        Const.c = c.doubleValue
        
        Const.duration = duration.doubleValue
        Const.timeStep = timeStep.doubleValue
    }
}
