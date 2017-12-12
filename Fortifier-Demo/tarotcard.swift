//
//  tarotcard.swift
//  Fortifier-Demo
//
//  Created by Dennis Park on 12/04/17.
//  Copyright © 2017 NYU. All rights reserved.
//

import Foundation
import SpriteKit

enum CardType: Int{
    case a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p//,q,r,s,t,u,v,w,x,y,z
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
            frontTexture = SKTexture(imageNamed: "A")
            largeTextureFilename = "A_large"
        case .b:
            frontTexture = SKTexture(imageNamed: "B")
            largeTextureFilename = "B_large"
        case .c:
            frontTexture = SKTexture(imageNamed: "C")
            largeTextureFilename = "C_large"
        case .d:
            frontTexture = SKTexture(imageNamed: "D")
            largeTextureFilename = "D_large"
        case .e:
            frontTexture = SKTexture(imageNamed: "E")
            largeTextureFilename = "E_large"
        case .f:
            frontTexture = SKTexture(imageNamed: "F")
            largeTextureFilename = "F_large"
        case .g:
            frontTexture = SKTexture(imageNamed: "G")
            largeTextureFilename = "G_large"
        case .h:
            frontTexture = SKTexture(imageNamed: "H")
            largeTextureFilename = "H_large"
        case .i:
            frontTexture = SKTexture(imageNamed: "I")
            largeTextureFilename = "I_large"
        case .j:
            frontTexture = SKTexture(imageNamed: "J")
            largeTextureFilename = "J_large"
        case .k:
            frontTexture = SKTexture(imageNamed: "K")
            largeTextureFilename = "K_large"
        case .l:
            frontTexture = SKTexture(imageNamed: "L")
            largeTextureFilename = "L_large"
        case .m:
            frontTexture = SKTexture(imageNamed: "M")
            largeTextureFilename = "M_large"
        case .n:
            frontTexture = SKTexture(imageNamed: "N")
            largeTextureFilename = "N_large"
        case .o:
            frontTexture = SKTexture(imageNamed: "O")
            largeTextureFilename = "O_large"
        case .p:
            frontTexture = SKTexture(imageNamed: "P")
            largeTextureFilename = "P_large"
            /* case .q:
             frontTexture = SKTexture(imageNamed: "Q")
             largeTextureFilename = "Q_large"
             case .r:
             frontTexture = SKTexture(imageNamed: "R")
             largeTextureFilename = "R_large"
             case .s:
             frontTexture = SKTexture(imageNamed: "S")
             largeTextureFilename = "S_large"
             case .t:
             frontTexture = SKTexture(imageNamed: "T")
             largeTextureFilename = "T_large"
             case .u:
             frontTexture = SKTexture(imageNamed: "U")
             largeTextureFilename = "U_large"
             case .v:
             frontTexture = SKTexture(imageNamed: "V")
             largeTextureFilename = "V_large"
             case .w:
             frontTexture = SKTexture(imageNamed: "W")
             largeTextureFilename = "W_large"
             case .x:
             frontTexture = SKTexture(imageNamed: "X")
             largeTextureFilename = "X_large"
             case .y:
             frontTexture = SKTexture(imageNamed: "Y")
             largeTextureFilename = "Y_large"
             case .z:
             frontTexture = SKTexture(imageNamed: "Z")
             largeTextureFilename = "Z_large"
             */
        }
        
        super.init(texture: backTexture, color: .clear, size: frontTexture.size())
    }
    func flip() {
        if enlarged{return}
        
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
                //self.zPosition = CardLevel.board.rawValue
                self.faceUp = true
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
                //zRotation = 0
                let newPosition = CGPoint(x: parent.frame.midX, y: parent.frame.midY)
                let slide = SKAction.move(to:newPosition, duration:0.3)
                let scaleUp = SKAction.scale(to:5.0, duration:0.3)
                run(SKAction.group([slide, scaleUp]))
            }
        }
    }
    
}


