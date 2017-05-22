//
//  Euler.swift
//  Particle motion
//
//  Created by Bart Robat on 21/05/2017.
//  Copyright © 2017 Bart Robat. All rights reserved.
//

import Cocoa
import SpriteKit


class Euler: SKScene {
    
    let duration = Const.duration
    let timeStep = Const.timeStep
    
    //stałe fizyczne
    let q = Const.q //ładunek
    let k = Const.k //
    let m = Const.m //masa
    let c = Const.c
    
    //Wartości pola magnetycznego
    var Bx = Const.Bx
    var By = Const.By
    var Bz = Const.Bz
    
    //Początkowe położenie
    var x = Const.x
    var y = Const.y
    var z = Const.z
    
    //Początkowe wartości prędkości
    var Vx = Const.Vx
    var Vy = Const.Vy
    var Vz = Const.Vz
    
    var Px = Double()
    var Py = Double()
    var Pz = Double()
    
    var En = Double()
    
    var k1x = Double()
    var k2x = Double()
    var k3x = Double()
    var k4x = Double()
    
    var k1y = Double()
    var k2y = Double()
    var k3y = Double()
    var k4y = Double()
    
    var k1z = Double()
    var k2z = Double()
    var k3z = Double()
    var k4z = Double()
    
    var time = 0.0
    
    
    override func sceneDidLoad() {
        
        backgroundColor = SKColor.white
        
        let axisX = SKShapeNode(rectOf: CGSize(width:1500, height: 2))
        axisX.fillColor = .black
        axisX.lineWidth = 0
        axisX.position = CGPoint(x: 0, y: 0)
        addChild(axisX)
        
        let axisY = SKShapeNode(rectOf: CGSize(width:2, height: 1000))
        axisY.fillColor = .black
        axisY.lineWidth = 0
        axisY.position = CGPoint(x: 0, y: 0)
        addChild(axisY)
        
        
        
        let pointx = SKShapeNode(circleOfRadius: 1)
        pointx.fillColor = .red
        pointx.lineWidth = 0
        
        
        
        while time <= duration {
            print("")
            print("time: \(time) / \(duration)")
            
            
            if time >= 0.0{
                // Px
                k1x = timeStep * f(t: time, x1: x, x2: y, x3: z, v2: Vy, v3: Vz, B2: By, B3: Bz, k: k, q: q)
                Px += (k1x)
                
                // Py
                k1y = timeStep * f(t: time, x1: y, x2: z, x3: x, v2: Vz, v3: Vx, B2: Bz, B3: Bx, k: k, q: q)
                Py += (k1y)
                
                //Pz
                k1z = timeStep * f(t: time, x1: z, x2: x, x3: y, v2: Vx, v3: Vy, B2: Bx, B3: By, k: k, q: q)
                Pz += (k1z)
                
                
            }
            print("Px: \(Px)")
            print("Py: \(Py)")
            print("Pz: \(Pz)")
            
            //Mam wszystkie pędy dla danego kroku czasowego. Teraz liczę energi
            En = sqrt(pow(m,2)*pow(c,4) + pow(c,2)*(Px*Px + Py*Py + Pz*Pz))
            
            print("En: \(En)")
            
            //Mając energię i pędy korzystam z zleżności między pędem, prędkością i energią
            Vx += Px * pow(c,2) / En
            Vy += Py * pow(c,2) / En
            Vz += Pz * pow(c,2) / En
            
            print("vx: \(Vx)")
            print("vy: \(Vy)")
            print("vz: \(Vz)")
            
            //Obliczam położenie
            x += Vx * timeStep
            y += Vy * timeStep
            z += Vz * timeStep
            
            print("x: \(x)")
            print("y: \(y)")
            print("z: \(z)")
            
            let cpointx = pointx.copy() as! SKShapeNode
            cpointx.position = CGPoint(x: x, y: y)
            
            addChild(cpointx)
            
            //przechodzę do następnego kroku czasowego
            time += timeStep
        }
        
    }
    
    
    func f(t: Double,x1:Double,x2:Double,x3:Double,v2:Double,v3:Double,B2:Double,B3:Double,k:Double, q:Double) -> Double{
        
        let supbro = q*t*((2*k*x1)/pow(pow(x1,2)+pow(x2,2)+pow(x2,2),2)+v2*B3-v3*B2)
        
        return supbro
    }
    
    // Lorentz force for constant E
    
    /*
     func f(t: Double,x1:Double,x2:Double,x3:Double,v2:Double,v3:Double,B2:Double,B3:Double,k:Double, q:Double) -> Double{
     
     let supbro = q*t*(k + v2*B3 - v3*B2)
     
     return supbro
     }
     */
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
    
    
    
    
    
    

