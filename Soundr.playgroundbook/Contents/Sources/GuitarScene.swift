//
//  GameScene.swift
//  wwdcSK
//
//  Created by Gustavo Fonseca Olenka on 26/03/17.
//  Copyright © 2017 Gustavo Fonseca Olenka. All rights reserved.
//

import SpriteKit
import Foundation
import UIKit

public class GuitarScene: SKScene{
    public var guitarSimulator = GuitarSoundSimulator()

    public var guitarStrings:[SKSpriteNode] = []
    static var currentTime = Double(0)
    
    public var background:SKSpriteNode!

    public var guitarStringStandingTexture = SKTexture(imageNamed: "StringStanding")
    public var guitarStringPlayingTextures:[SKTexture] = [SKTexture(imageNamed: "StringPlaying01"), SKTexture(imageNamed: "StringPlaying02"), SKTexture(imageNamed: "StringPlaying03"),SKTexture(imageNamed: "StringPlaying01"), SKTexture(imageNamed: "StringPlaying02"), SKTexture(imageNamed: "StringPlaying03"),SKTexture(imageNamed: "StringPlaying01"), SKTexture(imageNamed: "StringPlaying02"), SKTexture(imageNamed: "StringPlaying03")]

    override public init(size: CGSize) {
        super.init(size: size)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func didMove(to view: SKView) {
        guitarSimulator.guitarScene = self
        background = SKSpriteNode(imageNamed: "GuitarOfficial")
        background!.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        background!.size = CGSize(width: 728 , height: 1024)
        self.addChild(background)
        self.createStrings()
    }

    public func guitarExplanation(){
        self.background?.texture = SKTexture(imageNamed: "GuitarExplanation")
    }
    
    private func createStrings(){

        var guitarString1 = SKSpriteNode(imageNamed: "StringStanding")
        guitarString1.position = CGPoint(x: (self.view?.center.x)! + 67, y: (self.view?.center.y)!)
        guitarString1.size.width += 6
        guitarString1.zPosition = 2
        guitarString1.position.y -= 362

        var guitarString2 = SKSpriteNode(imageNamed: "StringStanding")
        guitarString2.position = CGPoint(x: (self.view?.center.x)! + 43, y: (self.view?.center.y)!)
        guitarString2.size.width += 6
        guitarString2.zPosition = 2
        guitarString2.position.y -= 362

        var guitarString3 = SKSpriteNode(imageNamed: "StringStanding")
        guitarString3.position = CGPoint(x: (self.view?.center.x)! + 14, y: (self.view?.center.y)!)
        guitarString3.size.width += 6
        guitarString3.zPosition = 2
        guitarString3.position.y -= 362

        var guitarString4 = SKSpriteNode(imageNamed: "StringStanding")
        guitarString4.position = CGPoint(x: (self.view?.center.x)! - 15, y: (self.view?.center.y)!)
        guitarString4.size.width += 6
        guitarString4.zPosition = 2
        guitarString4.position.y -= 362

        var guitarString5 = SKSpriteNode(imageNamed: "StringStanding")
        guitarString5.position = CGPoint(x: (self.view?.center.x)! - 44, y: (self.view?.center.y)!)
        guitarString5.size.width += 6
        guitarString5.zPosition = 2
        guitarString5.position.y -= 362

        var guitarString6 = SKSpriteNode(imageNamed: "StringStanding")
        guitarString6.position = CGPoint(x: (self.view?.center.x)! - 70, y: (self.view?.center.y)!)
        guitarString6.size.width += 6
        guitarString6.zPosition = 2
        guitarString6.position.y -= 362

        guitarStrings.append(guitarString1)
        guitarStrings.append(guitarString2)
        guitarStrings.append(guitarString3)
        guitarStrings.append(guitarString4)
        guitarStrings.append(guitarString5)
        guitarStrings.append(guitarString6)

        addChild(guitarString1)
        addChild(guitarString2)
        addChild(guitarString3)
        addChild(guitarString4)
        addChild(guitarString5)
        addChild(guitarString6)
    }

    public func vibrateString(stringNumber:Int){
        if (guitarSimulator.guitarStrings[stringNumber - 1].guitarStringIsPlaying == false){
            self.guitarSimulator.guitarStrings[stringNumber - 1].guitarStringIsVibrating = true
            var vibrate = SKAction.animate(with: guitarStringPlayingTextures, timePerFrame: 0.045, resize: false, restore: true)
            
            for i in 0...8{
                guitarStrings[stringNumber - 1].run(vibrate)
                self.guitarStrings[stringNumber - 1].run(vibrate, completion: {
                    self.guitarStrings[stringNumber - 1].run(SKAction.setTexture(self.guitarStringStandingTexture))
                    
                })
            }
            self.guitarSimulator.guitarStrings[stringNumber - 1].guitarStringIsVibrating = false
        }
    }
    

    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        for touch in touches {
//            self.touchDown(atPoint: t.location(in: self))
            let coordinates = touch.location(in: self)
            print(coordinates.debugDescription)

            if guitarStrings[1 - 1].contains(coordinates){ // e
                guitarSimulator.playNoteOnScreen(stringNumber: 1, intervalFromLastNote: 0)
            }
            else if guitarStrings[2 - 1].contains(coordinates){ // B
                guitarSimulator.playNoteOnScreen(stringNumber: 2, intervalFromLastNote: 0)
            }
            else if guitarStrings[3 - 1].contains(coordinates){ // G
                guitarSimulator.playNoteOnScreen(stringNumber: 3, intervalFromLastNote: 0)
            }
            else if guitarStrings[4 - 1].contains(coordinates){ // D
                guitarSimulator.playNoteOnScreen(stringNumber: 4, intervalFromLastNote: 0)
            }
            else if guitarStrings[5 - 1].contains(coordinates){ // A
                guitarSimulator.playNoteOnScreen(stringNumber: 5, intervalFromLastNote: 0)
            }
            else if guitarStrings[6 - 1].contains(coordinates){ // E
                guitarSimulator.playNoteOnScreen(stringNumber: 6, intervalFromLastNote: 0)
            }
            else {

            }
        }
    }

    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
        for touch in touches {
            //            self.touchDown(atPoint: t.location(in: self))
            let coordinates = touch.location(in: self)
            print(coordinates.debugDescription)
            
            if guitarStrings[1 - 1].contains(coordinates){ // e
                guitarSimulator.playNoteOnScreen(stringNumber: 1, intervalFromLastNote: 0)
            }
            else if guitarStrings[2 - 1].contains(coordinates){ // B
                guitarSimulator.playNoteOnScreen(stringNumber: 2, intervalFromLastNote: 0)
            }
            else if guitarStrings[3 - 1].contains(coordinates){ // G
                guitarSimulator.playNoteOnScreen(stringNumber: 3, intervalFromLastNote: 0)
            }
            else if guitarStrings[4 - 1].contains(coordinates){ // D
                guitarSimulator.playNoteOnScreen(stringNumber: 4, intervalFromLastNote: 0)
            }
            else if guitarStrings[5 - 1].contains(coordinates){ // A
                guitarSimulator.playNoteOnScreen(stringNumber: 5, intervalFromLastNote: 0)
            }
            else if guitarStrings[6 - 1].contains(coordinates){ // E
                guitarSimulator.playNoteOnScreen(stringNumber: 6, intervalFromLastNote: 0)
            }
            else {
                
            }
        }
    }

    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }

    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        //        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }


    override public func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }

    public func playTwinkleTwinkleLittleStar(){
        guitarSimulator.resetMusicSequence()
        
        guitarSimulator.setNotes(stringNumbers: [1, 6], fratNumbers: [0, 0])
        guitarSimulator.playNotes(stringNumbers: [1, 6], intervalFromLastNote: 0.3)
        
        guitarSimulator.setNote(stringNumber: 1, fratNumber: 0)
        guitarSimulator.playNote(stringNumber: 1, intervalFromLastNote: 0.9)
        
        guitarSimulator.setNote(stringNumber: 1, fratNumber: 7)
        guitarSimulator.playNote(stringNumber: 1, intervalFromLastNote: 0.7)
        
        guitarSimulator.setNote(stringNumber: 1, fratNumber: 7)
        guitarSimulator.playNote(stringNumber: 1, intervalFromLastNote: 0.7)
        
        guitarSimulator.setNotes(stringNumbers: [1, 5], fratNumbers: [9, 0])
        guitarSimulator.playNotes(stringNumbers: [1, 5], intervalFromLastNote: 0.7)
        
        guitarSimulator.setNote(stringNumber: 1, fratNumber: 9)
        guitarSimulator.playNote(stringNumber: 1, intervalFromLastNote: 0.7)
        
        guitarSimulator.setNotes(stringNumbers: [1, 6], fratNumbers: [7, 0])
        guitarSimulator.playNotes(stringNumbers: [1, 6], intervalFromLastNote: 0.7)
        
        guitarSimulator.setNotes(stringNumbers: [1, 5], fratNumbers: [5, 0])
        guitarSimulator.playNotes(stringNumbers: [1, 5], intervalFromLastNote: 1.3)
        
        guitarSimulator.setNote(stringNumber: 1, fratNumber: 5)
        guitarSimulator.playNote(stringNumber: 1, intervalFromLastNote: 0.7)

        
        guitarSimulator.setNotes(stringNumbers: [1, 6], fratNumbers: [4, 0])
        guitarSimulator.playNotes(stringNumbers: [1, 6], intervalFromLastNote: 0.7)
        
        // user to play
        
//        guitarSimulator.setNote(stringNumber: 1, fratNumber: 4)
//        guitarSimulator.playNote(stringNumber: 1, intervalFromLastNote: 0.7)
//        
//        guitarSimulator.setNotes(stringNumbers: [1, 2], fratNumbers: [2, 0])
//        guitarSimulator.playNotes(stringNumbers: [1, 2], intervalFromLastNote: 0.7)
//        
//        guitarSimulator.setNote(stringNumber: 1, fratNumber: 2)
//        guitarSimulator.playNote(stringNumber: 1, intervalFromLastNote: 0.7)
//        
//        guitarSimulator.setNotes(stringNumbers: [1, 6], fratNumbers: [0, 0])
//        guitarSimulator.playNotes(stringNumbers: [1, 6], intervalFromLastNote: 0.7)
        
    }
    
    public func playGravity(){
        guitarSimulator.resetMusicSequence()
        
        guitarSimulator.setNote(stringNumber: 3, fratNumber: 9)
        guitarSimulator.playNote(stringNumber: 3, intervalFromLastNote: 0.3)
        
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 8)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.5)
        
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 8)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 12)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.35)
        
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 12)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.3)
        //
        //        ///////////////////////////////////////////////////////////////////////////
        //
        guitarSimulator.setNote(stringNumber: 3, fratNumber: 9)
        guitarSimulator.playNote(stringNumber: 3, intervalFromLastNote: 2.5)
        
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 8)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.5)
        
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 8)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.3)
        
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 12)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.35)
        
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 12)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.35)
        
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 10)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.3)
        
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 10)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.25)
        
        //
        //        ///////////////////////////////////////////////////////////////////////
        //
        guitarSimulator.setNote(stringNumber: 3, fratNumber: 9)
        guitarSimulator.playNote(stringNumber: 3, intervalFromLastNote: 3)
        
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 8)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 8)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.3)
        
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 12)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.35)
        
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 12)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.3)
        
        
        //        /////////////////////////////////////////////////////////////////////////
        guitarSimulator.setNote(stringNumber: 3, fratNumber: 9)
        guitarSimulator.playNote(stringNumber: 3, intervalFromLastNote: 3.0)
        
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 8)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.5)
        
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 8)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.3)
        
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 12)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 10)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.3)
        
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 8)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.3)
        
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 8)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.3)
        
        guitarSimulator.setNote(stringNumber: 3, fratNumber: 9)
        guitarSimulator.playNote(stringNumber: 3, intervalFromLastNote: 1.2)
        
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 10)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.2)
        
    }
    
    public func playThinkingOutLoud(){

        guitarSimulator.resetMusicSequence()
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.3)
        
        guitarSimulator.setNote(stringNumber: 3, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 3, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 0)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 3, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 3, intervalFromLastNote: 0.35)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.45)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.3)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 0)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.25)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.25)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.3)
        
        guitarSimulator.setNote(stringNumber: 5, fratNumber: 0)
        guitarSimulator.playNote(stringNumber: 5, intervalFromLastNote: 0.25)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 0)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.25)
        
        //////////////////////////////////////////////////////////////////////////////
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 2)
        
        guitarSimulator.setNote(stringNumber: 3, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 3, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 0)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 3, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 3, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 3, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 0)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 0)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.2)
        
        //////////////////////////////////////////////////////////////////////////////
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 2)
        
        guitarSimulator.setNote(stringNumber: 3, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 3, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 0)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 3, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 3, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 3, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 0)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 0)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 3, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 5, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 0)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.2)
        
        ////////////////////////////////////////////////////////////////////////////////
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 2)
        
        guitarSimulator.setNote(stringNumber: 3, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 3, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 0)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 3, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 3, intervalFromLastNote: 0.35)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.35)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.35)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 0)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.25)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 0)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.25)
    }

    public func playFreeFallin(){
        guitarSimulator.resetMusicSequence()

        guitarSimulator.setNotes(stringNumbers: [2, 4], fratNumbers: [6, 3])
        guitarSimulator.playNotes(stringNumbers: [2, 4], intervalFromLastNote: 0.3)
        
        guitarSimulator.setNote(stringNumber: 3, fratNumber: 5)
        guitarSimulator.playNote(stringNumber: 3, intervalFromLastNote: 0.5)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 3)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.22)
        
        guitarSimulator.setNote(stringNumber: 6, fratNumber: 3)
        guitarSimulator.playNote(stringNumber: 6, intervalFromLastNote: 0.22)
        
        guitarSimulator.setNote(stringNumber: 6, fratNumber: 6)
        guitarSimulator.playNote(stringNumber: 6, intervalFromLastNote: 0.40)
        
        guitarSimulator.setNotes(stringNumbers: [2, 3, 6], fratNumbers: [6, 5, 6])
        guitarSimulator.playNotes(stringNumbers: [2, 3, 6], intervalFromLastNote: 1.5)
        
        guitarSimulator.setNotes(stringNumbers: [2, 3, 6], fratNumbers: [6, 5, 5])
        guitarSimulator.playNotes(stringNumbers: [2, 3, 6], intervalFromLastNote: 0.4)
        
        guitarSimulator.setNotes(stringNumbers: [2, 3, 4, 5], fratNumbers: [5, 5, 5, 3])
        guitarSimulator.playNotes(stringNumbers: [2, 3, 4 , 5], intervalFromLastNote: 0.7)
        
        /////////////////////////////////////////////////////////////////
        
        guitarSimulator.setNote(stringNumber: 5, fratNumber: 3)
        guitarSimulator.playNote(stringNumber: 5, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 5)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.22)
        
        guitarSimulator.setNotes(stringNumbers: [2, 3], fratNumbers: [5, 5])
        guitarSimulator.playNotes(stringNumbers: [2, 3], intervalFromLastNote: 0.22)
        
        guitarSimulator.setNotes(stringNumbers: [2, 3], fratNumbers: [6, 7])
        guitarSimulator.playNotes(stringNumbers: [2, 3], intervalFromLastNote: 0.15)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 5)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.25)
        
        guitarSimulator.setNote(stringNumber: 5, fratNumber: 3)
        guitarSimulator.playNote(stringNumber: 5, intervalFromLastNote: 0.22)
        
        ////// END PART 1
        
        guitarSimulator.setNote(stringNumber: 6, fratNumber: 5)
        guitarSimulator.playNote(stringNumber: 6, intervalFromLastNote: 0.3)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 3)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.22)
        
        
        guitarSimulator.setNote(stringNumber: 3, fratNumber: 5)
        guitarSimulator.playNote(stringNumber: 3, intervalFromLastNote: 0.22)
        
        //Pull off sequence of 2 notes
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 6)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.22)
        
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 5)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 6, fratNumber: 6)
        guitarSimulator.playNote(stringNumber: 6, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNotes(stringNumbers: [3, 4, 6], fratNumbers: [5, 3, 6])
        guitarSimulator.playNotes(stringNumbers: [3, 4, 6], intervalFromLastNote: 0.3)
        
        //////////////////////////////////////////////////////////////////////////////
        
        guitarSimulator.setNotes(stringNumbers: [2, 3, 4, 6], fratNumbers: [3 ,5, 3, 6])
        guitarSimulator.playNotes(stringNumbers: [2, 3, 4, 6], intervalFromLastNote: 1.5)
        
        guitarSimulator.setNotes(stringNumbers: [2, 3, 4, 6], fratNumbers: [6 ,5, 3, 5])
        guitarSimulator.playNotes(stringNumbers: [2, 3, 4, 6], intervalFromLastNote: 0.4)
        
        guitarSimulator.setNotes(stringNumbers: [2, 3, 4, 5], fratNumbers: [5, 5, 5, 3])
        guitarSimulator.playNotes(stringNumbers: [2, 3, 4 , 5], intervalFromLastNote: 0.7)
        
        //////////////////////////////////////////////////////////////////////////////
        
        guitarSimulator.setNote(stringNumber: 5, fratNumber: 3)
        guitarSimulator.playNote(stringNumber: 5, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 5)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.22)
        
        guitarSimulator.setNotes(stringNumbers: [2, 3], fratNumbers: [5, 5])
        guitarSimulator.playNotes(stringNumbers: [2, 3], intervalFromLastNote: 0.22)
        
        guitarSimulator.setNotes(stringNumbers: [2, 3], fratNumbers: [6, 7])
        guitarSimulator.playNotes(stringNumbers: [2, 3], intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 5)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.22)
        
        guitarSimulator.setNote(stringNumber: 6, fratNumber: 3)
        guitarSimulator.playNote(stringNumber: 6, intervalFromLastNote: 0.22)
        
        ///////////// END PART 2
        
        guitarSimulator.setNote(stringNumber: 6, fratNumber: 5)
        guitarSimulator.playNote(stringNumber: 6, intervalFromLastNote: 0.3)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 3)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.22)
        
        
        guitarSimulator.setNote(stringNumber: 3, fratNumber: 5)
        guitarSimulator.playNote(stringNumber: 3, intervalFromLastNote: 0.22)
        
        //Pull off sequence of 2 notes
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 6)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.22)
        
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 5)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 6, fratNumber: 5)
        guitarSimulator.playNote(stringNumber: 6, intervalFromLastNote: 0.2)
        
        /////
        guitarSimulator.setNotes(stringNumbers: [2, 3, 4, 6], fratNumbers: [3, 5, 3, 6])
        guitarSimulator.playNotes(stringNumbers: [2, 3, 4, 6], intervalFromLastNote: 0.3)
        /////
        guitarSimulator.setNotes(stringNumbers: [2, 3, 4, 6], fratNumbers: [3 ,5, 3, 6])
        guitarSimulator.playNotes(stringNumbers: [2, 3, 4, 6], intervalFromLastNote: 1.5)
        
        guitarSimulator.setNotes(stringNumbers: [2, 3, 4, 6], fratNumbers: [6 ,5, 3, 5])
        guitarSimulator.playNotes(stringNumbers: [2, 3, 4, 6], intervalFromLastNote: 0.4)
        
        guitarSimulator.setNotes(stringNumbers: [2, 3, 4, 5], fratNumbers: [5, 5, 5, 3])
        guitarSimulator.playNotes(stringNumbers: [2, 3, 4 , 5], intervalFromLastNote: 0.7)
        
        guitarSimulator.setNote(stringNumber: 5, fratNumber: 3)
        guitarSimulator.playNote(stringNumber: 5, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 5)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.22)
        
        
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 5)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.22)
        
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 6)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.15)
        
        guitarSimulator.setNote(stringNumber: 5, fratNumber: 3)
        guitarSimulator.playNote(stringNumber: 5, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 5)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.2)
//
        ///// END PART 3
        
        guitarSimulator.setNote(stringNumber: 6, fratNumber: 5)
        guitarSimulator.playNote(stringNumber: 6, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 3)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.2)
        
        
        guitarSimulator.setNote(stringNumber: 3, fratNumber: 5)
        guitarSimulator.playNote(stringNumber: 3, intervalFromLastNote: 0.2)
        
        //Pull off sequence of 2 notes
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 6)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 5)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 6, fratNumber: 3)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 5)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.2)
        
        
        guitarSimulator.setNotes(stringNumbers: [2, 3, 4, 6], fratNumbers: [3, 5, 3, 6])
        guitarSimulator.playNotes(stringNumbers: [2, 3, 4, 6], intervalFromLastNote: 0.5)
        
        guitarSimulator.setNote(stringNumber: 6, fratNumber: 6)
        guitarSimulator.playNote(stringNumber: 6, intervalFromLastNote: 0.3)
    
        
        guitarSimulator.setNotes(stringNumbers: [2, 3, 4, 6], fratNumbers: [3 ,5, 3, 6])
        guitarSimulator.playNotes(stringNumbers: [2, 3, 4, 6], intervalFromLastNote: 1.5)
        
        guitarSimulator.setNotes(stringNumbers: [2, 3, 4, 6], fratNumbers: [6 ,5, 3, 5])
        guitarSimulator.playNotes(stringNumbers: [2, 3, 4, 6], intervalFromLastNote: 0.4)
        
        guitarSimulator.setNotes(stringNumbers: [2, 3, 4, 5], fratNumbers: [5, 5, 5, 3])
        guitarSimulator.playNotes(stringNumbers: [2, 3, 4 , 5], intervalFromLastNote: 0.7)
        
        guitarSimulator.setNote(stringNumber: 5, fratNumber: 3)
        guitarSimulator.playNote(stringNumber: 5, intervalFromLastNote: 0.6)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 5)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 3, fratNumber: 5)
        guitarSimulator.playNote(stringNumber: 3, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 5)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.2)
        
        
    }
    
    public func playUnderTheBridge(){
        guitarSimulator.resetMusicSequence()
        guitarSimulator.setNotes(stringNumbers: [2, 5], fratNumbers: [3, 5])
        guitarSimulator.playNotes(stringNumbers: [2, 5], intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 3, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 3, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 3)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.3)
        
        guitarSimulator.setNote(stringNumber: 3, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 3, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 5, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 5, intervalFromLastNote: 0.6)
        
        guitarSimulator.setNote(stringNumber: 5, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 5, intervalFromLastNote: 0.25)
        
        guitarSimulator.setNote(stringNumber: 5, fratNumber: 0)
        guitarSimulator.playNote(stringNumber: 5, intervalFromLastNote: 0.25)
        
        guitarSimulator.setNote(stringNumber: 6, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 6, intervalFromLastNote: 0.2)
        
        
        //////////////////// END OF FIRST SEQUENCE
        
        guitarSimulator.setNotes(stringNumbers: [2, 6], fratNumbers: [2, 2])
        guitarSimulator.playNotes(stringNumbers: [2, 6], intervalFromLastNote: 0.55)
        
        guitarSimulator.setNote(stringNumber: 5, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 5, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 5, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 5, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 3, fratNumber: 3)
        guitarSimulator.playNote(stringNumber: 3, intervalFromLastNote: 0.3)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.6)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.25)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 0)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.25)
        
        guitarSimulator.setNote(stringNumber: 5, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 5, intervalFromLastNote: 0.2)
        
        //////////////////// END OF SECOND SEQUENCE
        
        guitarSimulator.setNotes(stringNumbers: [2, 5], fratNumbers: [3, 4])
        guitarSimulator.playNotes(stringNumbers: [2, 5], intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 5, fratNumber: 5)
        guitarSimulator.playNote(stringNumber: 5, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 5, fratNumber: 5)
        guitarSimulator.playNote(stringNumber: 5, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 3, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 3, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 3, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 3, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 3)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.3)
        
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 5)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.25)
        
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 3)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.25)
        
        guitarSimulator.setNote(stringNumber: 3, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 3, intervalFromLastNote: 0.3)
        
        guitarSimulator.setNotes(stringNumbers: [4, 5], fratNumbers: [4, 5])
        guitarSimulator.playNotes(stringNumbers: [4, 5], intervalFromLastNote: 0.2)
        
        guitarSimulator.setNotes(stringNumbers: [4, 5], fratNumbers: [6, 7])
        guitarSimulator.playNotes(stringNumbers: [4, 5], intervalFromLastNote: 0.2)
        
        guitarSimulator.setNotes(stringNumbers: [4, 5], fratNumbers: [6, 7])
        guitarSimulator.playNotes(stringNumbers: [4, 5], intervalFromLastNote: 0.2)
        
        ///////////////////////END OF THIRD SEQUENCE
        
        guitarSimulator.setNote(stringNumber: 6, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 6, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 5, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 5, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 5, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 5, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 3, fratNumber: 3)
        guitarSimulator.playNote(stringNumber: 3, intervalFromLastNote: 0.3)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.6)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.25)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 0)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.25)
        
        guitarSimulator.setNote(stringNumber: 5, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 5, intervalFromLastNote: 0.2)
        
        //////////////////END OF FOURTH SEQUENCE
        
        guitarSimulator.setNotes(stringNumbers: [2, 5], fratNumbers: [3, 4])
        guitarSimulator.playNotes(stringNumbers: [2, 5], intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 5, fratNumber: 5)
        guitarSimulator.playNote(stringNumber: 5, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 5, fratNumber: 5)
        guitarSimulator.playNote(stringNumber: 5, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 3, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 3, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 3, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 3, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 5, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 5, intervalFromLastNote: 0.6)
        
        guitarSimulator.setNote(stringNumber: 5, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 5, intervalFromLastNote: 0.25)
        
        guitarSimulator.setNote(stringNumber: 5, fratNumber: 0)
        guitarSimulator.playNote(stringNumber: 5, intervalFromLastNote: 0.25)
        
        guitarSimulator.setNote(stringNumber: 6, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 6, intervalFromLastNote: 0.2)
        
        //////////// END OF FIFTH SEQUENCE
        
        guitarSimulator.setNotes(stringNumbers: [2, 6], fratNumbers: [2, 2])
        guitarSimulator.playNotes(stringNumbers: [2, 6], intervalFromLastNote: 0.55)
        
        guitarSimulator.setNote(stringNumber: 5, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 5, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 5, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 5, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 3, fratNumber: 3)
        guitarSimulator.playNote(stringNumber: 3, intervalFromLastNote: 0.3)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.6)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.25)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 0)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.25)
        
        guitarSimulator.setNote(stringNumber: 5, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 5, intervalFromLastNote: 0.2)
        
        /////////// END OF SIXTH SEQUENCE
        
        guitarSimulator.setNotes(stringNumbers: [2, 5], fratNumbers: [3, 4])
        guitarSimulator.playNotes(stringNumbers: [2, 5], intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 5, fratNumber: 5)
        guitarSimulator.playNote(stringNumber: 5, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 5, fratNumber: 5)
        guitarSimulator.playNote(stringNumber: 5, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 3, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 3, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 3, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 3, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 3)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.3)
        
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 5)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.25)
        
        guitarSimulator.setNote(stringNumber: 2, fratNumber: 3)
        guitarSimulator.playNote(stringNumber: 2, intervalFromLastNote: 0.25)
        
        guitarSimulator.setNote(stringNumber: 3, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 3, intervalFromLastNote: 0.3)
        
        guitarSimulator.setNotes(stringNumbers: [4, 5], fratNumbers: [4, 5])
        guitarSimulator.playNotes(stringNumbers: [4, 5], intervalFromLastNote: 0.2)
        
        guitarSimulator.setNotes(stringNumbers: [4, 5], fratNumbers: [6, 7])
        guitarSimulator.playNotes(stringNumbers: [4, 5], intervalFromLastNote: 0.2)
        
        guitarSimulator.setNotes(stringNumbers: [4, 5], fratNumbers: [6, 7])
        guitarSimulator.playNotes(stringNumbers: [4, 5], intervalFromLastNote: 0.2)
        
        ////////////// END OF SEVENTH SEQUENCE
        
        guitarSimulator.setNotes(stringNumbers: [2, 6], fratNumbers: [2, 2])
        guitarSimulator.playNotes(stringNumbers: [2, 6], intervalFromLastNote: 0.55)
        
        guitarSimulator.setNote(stringNumber: 5, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 5, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 5, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 5, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 3, fratNumber: 3)
        guitarSimulator.playNote(stringNumber: 3, intervalFromLastNote: 0.3)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 5, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 5, intervalFromLastNote: 0.25)
        
        guitarSimulator.setNote(stringNumber: 3, fratNumber: 3)
        guitarSimulator.playNote(stringNumber: 3, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 5, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 5, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.5)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.25)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 0)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.25)
        
        guitarSimulator.setNote(stringNumber: 5, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 5, intervalFromLastNote: 0.2)
        
    }
    
    public func playBeatIt(){
        guitarSimulator.resetMusicSequence()
        
        guitarSimulator.setNote(stringNumber: 6, fratNumber: 0)
        guitarSimulator.playNote(stringNumber: 6, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 6, fratNumber: 3)
        guitarSimulator.playNote(stringNumber: 6, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 5, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 5, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 3, fratNumber: 0)
        guitarSimulator.playNote(stringNumber: 3, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.5)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 0)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 0)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.4)
        
        //////////////
        
        guitarSimulator.setNote(stringNumber: 6, fratNumber: 0)
        guitarSimulator.playNote(stringNumber: 6, intervalFromLastNote: 0.7)
        
        guitarSimulator.setNote(stringNumber: 6, fratNumber: 3)
        guitarSimulator.playNote(stringNumber: 6, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 5, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 5, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 3, fratNumber: 0)
        guitarSimulator.playNote(stringNumber: 3, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.5)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.3)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 0)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.3)
        
        /////////
        
        guitarSimulator.setNote(stringNumber: 6, fratNumber: 0)
        guitarSimulator.playNote(stringNumber: 6, intervalFromLastNote: 0.7)
        
        guitarSimulator.setNote(stringNumber: 6, fratNumber: 3)
        guitarSimulator.playNote(stringNumber: 6, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 5, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 5, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 3, fratNumber: 0)
        guitarSimulator.playNote(stringNumber: 3, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.4)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.5)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 0)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 0)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.4)
        
        //////////////
        
        guitarSimulator.setNote(stringNumber: 6, fratNumber: 0)
        guitarSimulator.playNote(stringNumber: 6, intervalFromLastNote: 0.7)
        
        guitarSimulator.setNote(stringNumber: 6, fratNumber: 3)
        guitarSimulator.playNote(stringNumber: 6, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 5, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 5, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 3, fratNumber: 0)
        guitarSimulator.playNote(stringNumber: 3, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.2)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 4)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.5)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 2)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.3)
        
        guitarSimulator.setNote(stringNumber: 4, fratNumber: 0)
        guitarSimulator.playNote(stringNumber: 4, intervalFromLastNote: 0.3)

    }
    
    
    public func clearPlaylist(){
        guitarSimulator.resetMusicSequence()
    }
    
//    public func blockWhilePlayingNotes(){
//        self.guitarSimulator.blockScreen()
//    }

}
