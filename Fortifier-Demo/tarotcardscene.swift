//
//  tarotcardscene.swift
//  Fortifier-Demo
//
//  Created by Dennis Park on 12/11/17.
//  Copyright © 2017 NYU. All rights reserved.
//

import Foundation
import SpriteKit
enum CardLevel :CGFloat {
    case board = 10
    case moving = 100
    case enlarged = 200
}
class tarotcardscene: SKScene {
    
    override func didMove(to view: SKView) {
        let bg = SKSpriteNode(imageNamed: "background")
        bg.anchorPoint = CGPoint.zero
        bg.size = CGSize(width: 1125, height: 2436)
        bg.position = CGPoint.zero
        addChild(bg)
        
        let card1 = tarotcard(cardType: .a)
        card1.position = CGPoint(x: 100, y: 200)
        addChild(card1)
        
        let card2 = tarotcard(cardType: .b)
        card2.position = CGPoint(x: 300, y: 200)
        addChild(card2)
        
        let card3 = tarotcard(cardType: .c)
        card3.position = CGPoint(x: 500, y:200)
        addChild(card3)
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if let card = atPoint(location) as? tarotcard {
                if touch.tapCount == 1 {
                    card.flip()
                }
                if touch.tapCount == 2 {
                    card.enlarge()
                    return
                }
                if card.enlarged { return }
                card.zPosition = CardLevel.moving.rawValue
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if let card = atPoint(location) as? tarotcard {
                if card.enlarged { return }
                card.zPosition = CardLevel.board.rawValue
                card.removeFromParent()
                addChild(card)
            }
        }
    }
    
}
