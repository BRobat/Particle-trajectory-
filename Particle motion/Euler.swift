//
//  Euler.swift
//  Particle motion
//
//  Created by Bart Robat on 21/05/2017.
//  Copyright © 2017 Bart Robat. All rights reserved.
//
import Foundation
import SpriteKit


class Euler: SKScene {
    
    let duration = Const.duration
    let timeStep = Const.timeStep

    let q = Const.q
    let k = Const.k
    let m = Const.m
    let c = Const.c

    let Bx = Const.Bx
    let By = Const.By
    let Bz = Const.Bz

    var x = Const.x
    var y = Const.y
    var z = Const.z

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
    
    let maxSpeed = 4000.0

    override func sceneDidLoad() {

        backgroundColor = SKColor.white

        let axisX = SKShapeNode(rectOf: CGSize(width:2000, height: 3))
        axisX.fillColor = .black
        axisX.lineWidth = 0
        axisX.position = CGPoint(x: 0, y: 0)
        addChild(axisX)
        
        let axisY = SKShapeNode(rectOf: CGSize(width:3, height: 2000))
        axisY.fillColor = .black
        axisY.lineWidth = 0
        axisY.position = CGPoint(x: 0, y: 0)
        addChild(axisY)
        
        let iksy = SKShapeNode(rectOf: CGSize(width: 3, height: 10))
        iksy.fillColor = .black
        iksy.lineWidth = 0
        for i in 1...40{
            let ciksy = iksy.copy() as! SKShapeNode
            ciksy.position = CGPoint(x: -1000 + i*50, y: 0)
            addChild(ciksy)
        }
        
        let igrek = SKShapeNode(rectOf: CGSize(width: 10, height: 3))
        igrek.fillColor = .black
        igrek.lineWidth = 0
        for i in 1...40{
            let cigrek = igrek.copy() as! SKShapeNode
            cigrek.position = CGPoint(x: 0, y: -1000 + i*50)
            addChild(cigrek)
        }
        
        Px = m*Vx/sqrt(1 - pow(Vx,2)/pow(c,2))
        Py = m*Vy/sqrt(1 - pow(Vy,2)/pow(c,2))
        Pz = m*Vz/sqrt(1 - pow(Vz,2)/pow(c,2))
        
        run(SKAction.repeat(
            SKAction.sequence([
                SKAction.run(addPoint),
                SKAction.run(nextStep),
                SKAction.wait(forDuration: timeStep),
                ]), count: Int(duration/timeStep)
        ))
        
    }
    
    func addPoint() {
        
        let pointx = SKShapeNode(circleOfRadius: 2)

        if time < duration && x > -1000 && x < 1000 && y > -1000 && y < 1000 && z > -1000 && z < 1000 && Vx < maxSpeed && Vy < maxSpeed && Vz < maxSpeed{
            // Px
            k1x = timeStep * f(t: time, x1: x, x2: y, x3: z, v2: Vy, v3: Vz, B2: By, B3: Bz, k: k, q: q)
            Px += k1x
            
            // Py
            k1y = timeStep * f(t: time, x1: y, x2: z, x3: x, v2: Vz, v3: Vx, B2: Bz, B3: Bx, k: k, q: q)
            Py += k1y
            
            //Pz
            k1z = timeStep * f(t: time, x1: z, x2: x, x3: y, v2: Vx, v3: Vy, B2: Bx, B3: By, k: k, q: q)
            Pz += k1z
        
        
        En = sqrt(pow(m,2)*pow(c,4) + pow(c,2)*(pow(Px,2) + pow(Py,2) + pow(Pz,2)))
        
        Vx = Px * pow(c,2) / En
        Vy = Py * pow(c,2) / En
        Vz = Pz * pow(c,2) / En
        
        x += Vx * timeStep
        y += Vy * timeStep
        z += Vz * timeStep
        
        
            
            let cpointx = pointx.copy() as! SKShapeNode
            cpointx.fillColor = NSColor(red: CGFloat(colorC(i:z)), green: 0.2, blue: 0.2, alpha: 1.0)
            cpointx.position = CGPoint(x: x, y: y)
            cpointx.lineWidth = 0
            
            addChild(cpointx)
        
        }
    }
    
    func nextStep() {
        
        time += timeStep
    }
    
    func colorC(i: Double) -> Double {
        
        return sqrt(pow(1/1000*i,2))
        
    }
    
    func f(t: Double,x1:Double,x2:Double,x3:Double,v2:Double,v3:Double,B2:Double,B3:Double,k:Double, q:Double) -> Double{
        
        return q*t*((2*k*x1)/pow(pow(x1,2)+pow(x2,2)+pow(x3,2),2)+v2*B3-v3*B2)
    }
    
}
