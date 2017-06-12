//
//  Food.swift
//  Snake
//
//  Created by Brandon Price on 8/22/15.
//  Copyright (c) 2015 Brandon Price. All rights reserved.
//

import SpriteKit

class Food: SKSpriteNode {
    var Coordinates = CGPoint()
    var ActionDone = SKAction.removeFromParent()
    var FadeOut = SKAction()
    var FadeIn = SKAction()
    var Action = SKAction()
    
    init(Coordinate: CGPoint) {
        self.Coordinates = Coordinate
        super.init(texture: nil, color: UIColor.blackColor(), size: CGSize())
        
        self.alpha = 0.5
        
        FadeIn = SKAction.fadeAlphaTo(0.1, duration: 0.5)
        FadeOut = SKAction.fadeAlphaTo(0.5, duration: 0.5)
        Action = SKAction.repeatActionForever(SKAction.sequence([FadeOut,FadeIn]))
        self.runAction(SKAction.sequence([Action, ActionDone]))
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func StopFlashing () {
        self.removeAllActions()
    }
    func Flash () {
        self.runAction(SKAction.sequence([Action, ActionDone]))
    }
}