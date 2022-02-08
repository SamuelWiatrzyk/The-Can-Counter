//
//  GameView.swift
//  Can Counter 3.0
//
//  Created by Samuel Wiatrzyk on 2022-01-24.
//
import SpriteKit
import SwiftUI
import AVFoundation





class GameScene: SKScene {

    
    
    
    
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        if let particles = SKEmitterNode(fileNamed:  "Starfield") {
            
            
            particles.position = CGPoint(x: 1000, y: 0)
            particles.advanceSimulationTime(60)
            particles.zPosition = -1
            
            addChild(particles)
            
            
        }
        
    }
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
        let location = touch.location(in: self)
        
        
        let box = SKSpriteNode(color: .red, size: CGSize(width: 50, height: 50))
        box.position = location
        box.zPosition = 0
        box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50 , height: 50))
        
        
        addChild(box)
        
        
    }
    
    
    
    
}



struct GameView: View {
    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width:400, height: 500)
        scene.scaleMode = .fill
        
        return scene
    }
    var body: some View {
        SpriteView(scene: scene).frame(width: 400, height: 500)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
