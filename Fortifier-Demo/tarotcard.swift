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
var faceUp = false
var enlarged = false
var savedPosition = CGPoint.zero

class tarotcard : SKSpriteNode{
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
        case .b:
            frontTexture = SKTexture(imageNamed: "card_creature_bear")
        case .c:
            frontTexture = SKTexture(imageNamed: "card_creature_dragon")
        }
        
        super.init(texture: frontTexture, color: .clear, size: frontTexture.size())
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
}

