//
//  tarotcard.swift
//  Fortifier-Demo
//
//  Created by Dennis Park on 12/11/17.
//  Copyright © 2017 NYU. All rights reserved.
//

import Foundation
import SpriteKit

enum CardType: Int{
    case a,b,c
}


class tarotcard : SKSpriteNode{
    var faceUp = false
    var enlarged = false
    var savedPosition = CGPoint.zero
    var largeTexture :SKTexture?
    let largeTextureFilename :String
    let cardType :CardType
    let frontTexture :SKTexture
    let backTexture :SKTexture
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    init(cardType: CardType) {
        self.cardType = cardType
        backTexture = SKTexture(imageNamed: "card_back")
        
        switch cardType {
        case .a:
            frontTexture = SKTexture(imageNamed: "card_creature_wolf")
            largeTextureFilename = "card_creature_wolf_large"
        case .b:
            frontTexture = SKTexture(imageNamed: "card_creature_bear")
            largeTextureFilename = "card_creature_bear_large"
        case .c:
            frontTexture = SKTexture(imageNamed: "card_creature_dragon")
            largeTextureFilename = "card_creature_dragon_large"
        }
        
        super.init(texture: backTexture, color: .clear, size: frontTexture.size())
    }
    func flip() {
        let firstHalfFlip = SKAction.scaleX(to: 0.0, duration: 0.4)
        let secondHalfFlip = SKAction.scaleX(to: 1.0, duration: 0.4)
        
        setScale(1.0)
        
        if faceUp {
            run(firstHalfFlip) {
                self.texture = self.backTexture
                self.run(secondHalfFlip)
            }
        } else {
            run(firstHalfFlip) {
                self.texture = self.frontTexture
                self.run(secondHalfFlip)
            }
        }
        faceUp = !faceUp
    }
    func enlarge() {
        if enlarged {
            let slide = SKAction.move(to:savedPosition, duration:0.3)
            let scaleDown = SKAction.scale(to:1.0, duration:0.3)
            run(SKAction.group([slide, scaleDown])) {
                self.enlarged = false
                self.zPosition = CardLevel.board.rawValue
            }
        } else {
            enlarged = true
            savedPosition = position
            
            if largeTexture != nil {
                texture = largeTexture
            } else {
                largeTexture = SKTexture(imageNamed: largeTextureFilename)
                texture = largeTexture
            }
            
            zPosition = CardLevel.enlarged.rawValue
            
            if let parent = parent {
                removeAllActions()
                zRotation = 0
                let newPosition = CGPoint(x: parent.frame.midX, y: parent.frame.midY)
                let slide = SKAction.move(to:newPosition, duration:0.3)
                let scaleUp = SKAction.scale(to:5.0, duration:0.3)
                run(SKAction.group([slide, scaleUp]))
            }
        }
    }
}

