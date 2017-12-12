//
//  tarotcardscene.swift
//  Fortifier-Demo
//
//  Created by Dennis Park on 12/04/17.
//  Copyright © 2017 NYU. All rights reserved.
//

import Foundation
import SpriteKit
enum CardLevel :CGFloat {
    case board = 10
    case moving = 100
    case enlarged = 200
}
let typeofcards : [CardType] = [.a,.b,.c,.d,.e,.f,.g,.h,.i,.j,.k,.l,.m,.n,.o,.p] //,.q,.r,.s,.t,.u,.v,.w,.x,.y,.z]

class tarotcardscene: SKScene {
    
    override func didMove(to view: SKView) {
        var usetype = [CardType]()
        while(usetype.count != 16){   //26
            let rand = Int(arc4random_uniform(16))
            if (usetype.contains(typeofcards[rand])){
            }
            else{
                usetype.append(typeofcards[rand])
            }
            
        }
        let bg = SKSpriteNode(imageNamed: "background")
        bg.anchorPoint = CGPoint.zero
        bg.size = CGSize(width: 1125, height: 2436)
        bg.position = CGPoint.zero
        addChild(bg)
        
        let card1 = tarotcard(cardType: usetype[0])
        card1.position = CGPoint(x: 200, y: 400)
        addChild(card1)
        
        let card2 = tarotcard(cardType: usetype[1])
        card2.position = CGPoint(x: 450, y: 400)
        addChild(card2)
        
        let card3 = tarotcard(cardType: usetype[2])
        card3.position = CGPoint(x: 700, y:400)
        addChild(card3)
        
        let card4 = tarotcard(cardType: usetype[3])
        card4.position = CGPoint(x: 950, y:400)
        addChild(card4)
        
        let card5 = tarotcard(cardType: usetype[4])
        card5.position = CGPoint(x: 200, y:800)
        addChild(card5)
        
        let card6 = tarotcard(cardType: usetype[5])
        card6.position = CGPoint(x: 450, y:800)
        addChild(card6)
        
        let card7 = tarotcard(cardType: usetype[6])
        card7.position = CGPoint(x: 700, y:800)
        addChild(card7)
        
        let card8 = tarotcard(cardType: usetype[7])
        card8.position = CGPoint(x: 950, y:800)
        addChild(card8)
        
        let card9 = tarotcard(cardType: usetype[8])
        card9.position = CGPoint(x: 200, y:1200)
        addChild(card9)
        
        let card10 = tarotcard(cardType: usetype[9])
        card10.position = CGPoint(x: 450, y:1200)
        addChild(card10)
        
        let card11 = tarotcard(cardType: usetype[10])
        card11.position = CGPoint(x: 700, y:1200)
        addChild(card11)
        
        let card12 = tarotcard(cardType: usetype[11])
        card12.position = CGPoint(x: 950, y:1200)
        addChild(card12)
        
        let card13 = tarotcard(cardType: usetype[12])
        card13.position = CGPoint(x: 200, y:1600)
        addChild(card13)
        
        let card14 = tarotcard(cardType: usetype[13])
        card14.position = CGPoint(x: 450, y:1600)
        addChild(card14)
        
        let card15 = tarotcard(cardType: usetype[14])
        card15.position = CGPoint(x: 700, y:1600)
        addChild(card15)
        
        let card16 = tarotcard(cardType: usetype[15])
        card16.position = CGPoint(x: 950, y:1600)
        addChild(card16)
        
        /*let card17 = tarotcard(cardType: usetype[16])
         card17.position = CGPoint(x: 200, y:1000)
         addChild(card17)
         
         let card18 = tarotcard(cardType: usetype[17])
         card18.position = CGPoint(x: 400, y:1000)
         addChild(card18)
         
         let card19 = tarotcard(cardType: usetype[18])
         card19.position = CGPoint(x: 600, y:1000)
         addChild(card19)
         
         let card20 = tarotcard(cardType: usetype[19])
         card20.position = CGPoint(x: 800, y:1000)
         addChild(card20)
         
         let card21 = tarotcard(cardType: usetype[20])
         card21.position = CGPoint(x: 200, y:1200)
         addChild(card21)
         
         let card22 = tarotcard(cardType: usetype[21])
         card22.position = CGPoint(x: 400, y:1200)
         addChild(card22)
         
         let card23 = tarotcard(cardType: usetype[22])
         card23.position = CGPoint(x: 600, y:1200)
         addChild(card23)
         
         let card24 = tarotcard(cardType: usetype[23])
         card24.position = CGPoint(x: 800, y:1200)
         addChild(card24)
         
         let card25 = tarotcard(cardType: usetype[24])
         card25.position = CGPoint(x: 200, y:1400)
         addChild(card25)
         
         let card26 = tarotcard(cardType: usetype[25])
         card26.position = CGPoint(x: 400, y:1400)
         addChild(card26)
         */
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
