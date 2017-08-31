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
scene.guitarExplanation()

public func setNote(stringNumber:Int, fretNumber:Int){
    scene.guitarSimulator.setNote(stringNumber:stringNumber, fratNumber:fretNumber)
}
public func setNotes(stringNumbers:[Int], fretNumbers:[Int]){
    scene.guitarSimulator.setNotes(stringNumbers:stringNumbers, fratNumbers:fretNumbers)
}
public func playNote(stringNumber:Int, intervalFromLastNote:Double){
    scene.guitarSimulator.playNote(stringNumber:stringNumber, intervalFromLastNote:intervalFromLastNote)
}
public func playNotes(stringNumbers:[Int], intervalFromLastNote:Double){
    scene.guitarSimulator.playNotes(stringNumbers:stringNumbers, intervalFromLastNote: intervalFromLastNote)
}
//#-code-completion(everything, hide)
//#-end-hidden-code
/*:
 Here we will see programming and music combined. But how?
 It's simple, just setting and playing notes with methods.
 
 On setNote/setNotes, you choose one or more strings and mark the fretboard numbers to select a note or notes.
 
 On playNote/playNotes, you choose the string(s) you have set and the time interval, in seconds, from the last note played.
 
 For setNotes and playNotes the sequence of string numbers and fret numbers selected must always be the same.

 Always follow the pattern to play the notes correctly!
 
 Tap "Run My Code", check the what happens and listen the result, after that, go to next page!
*/
setNote(stringNumber:5, fretNumber:7)
playNote(stringNumber: 5, intervalFromLastNote:0.5)

setNotes(stringNumbers: [1,2], fretNumbers:[4,9])
playNotes(stringNumbers:[1,2], intervalFromLastNote:0.7)

setNotes(stringNumbers: [1,4,5,6], fretNumbers:[3,2,4,2])
playNotes(stringNumbers:[1,4,5,6], intervalFromLastNote:1.5)
//#-hidden-code
//#-editable-code
//#-end-editable-code
//#-end-hidden-code
