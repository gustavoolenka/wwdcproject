//#-hidden-code
//
//  Contents.swift
//
//  Created by Gustavo Fonseca Olenka on 26/03/17.
//  Copyright © 2017 Gustavo Fonseca Olenka. All rights reserved.
//
//#-end-hidden-code
//#-hidden-code
import PlaygroundSupport
import SpriteKit
let skView = SKView(frame: CGRect(x: 0, y: 0, width: 728, height: 1024))
let scene = GuitarScene(size: CGSize(width: 728, height: 1024))
skView.presentScene(scene)
scene.scaleMode = .aspectFill
PlaygroundPage.current.liveView = skView

func setNote(stringNumber:Int, fretNumber:Int){
    scene.guitarSimulator.setNote(stringNumber:stringNumber, fratNumber:fretNumber)
}
func setNotes(stringNumbers:[Int], fretNumbers:[Int]){
    scene.guitarSimulator.setNotes(stringNumbers:stringNumbers, fratNumbers:fretNumbers)
}
func playNote(stringNumber:Int, intervalFromLastNote:Double){
    scene.guitarSimulator.playNote(stringNumber:stringNumber, intervalFromLastNote:intervalFromLastNote)
}
func playNotes(stringNumbers:[Int], intervalFromLastNote:Double){
    scene.guitarSimulator.playNotes(stringNumbers:stringNumbers, intervalFromLastNote: intervalFromLastNote)
}
func playTwinkleTwinkleLittleStar(){
    scene.playTwinkleTwinkleLittleStar()
}
//#-end-hidden-code
//#-code-completion(everything, hide)
/*:# Now it is time to start playing some music !!!
 
 Now, I think you are able to help me to complete one song.
 
 Let's play Twinkle Twinkle Little Star, we need to complete the last 4 notes, so let's do it togheter!
 */
playTwinkleTwinkleLittleStar()

//I am going to help you with 2 more notes:
setNote(stringNumber: 1, fretNumber: 4)
playNote(stringNumber: 1, intervalFromLastNote: 0.7)

setNotes(stringNumbers: [1, 2], fretNumbers: [2, 0])
playNotes(stringNumbers: [1, 2], intervalFromLastNote: 0.7)

//Now is your time to shine, just replace the strings, frets and time inside the methods and tap "Run My Code".
//Note 1 : String 1, Fret 2, TimeInterval: 0.7
//Note 2 : String 1, Frets 0, TimeInterval: 0.7
setNote(stringNumber:/*#-editable-code*/<#T##value##Int#>/*#-end-editable-code*/, fretNumber:/*#-editable-code*/<#T##value##Int#>/*#-end-editable-code*/)
playNote(stringNumber:/*#-editable-code*/<#T##value##Int#>/*#-end-editable-code*/, intervalFromLastNote:/*#-editable-code*/<#T##value##Double#>/*#-end-editable-code*/)

setNote(stringNumber:/*#-editable-code*/<#T##value##Int#>/*#-end-editable-code*/, fretNumber:/*#-editable-code*/<#T##value##Int#>/*#-end-editable-code*/)
playNote(stringNumber:/*#-editable-code*/<#T##value##Int#>/*#-end-editable-code*/, intervalFromLastNote:/*#-editable-code*/<#T##value##Double#>/*#-end-editable-code*/)

