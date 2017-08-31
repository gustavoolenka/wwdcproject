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
private let skView = SKView(frame: CGRect(x: 0, y: 0, width: 728, height: 1024))
private let scene = GuitarScene(size: CGSize(width: 728, height: 1024))
skView.presentScene(scene)
PlaygroundPage.current.liveView = skView
//#-code-completion(keyword, hide, for, func, if, let, var, while)
//#-code-completion(identifier, hide, scene, skView, guitarSimulator, GuitarScene, GuitarSoundSimulator, GuitarString)
//#-code-completion(literal, hide, GuitarScene, skView, GuitarSoundSimulator, GuitarString)
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
//#-end-hidden-code
/*: 
 #This is the end and the beginning.
 
 You have all the knowledge and freedom to do anything here. Use all your creativity !
 You are able to create any groove you want.
 Hope you have enjoyed everything.
 
 */
//#-editable-code
setNote(stringNumber: <#T##value##Int#>, fretNumber: <#T##value##Int#>)
playNote(stringNumber: <#T##value##Int#>, intervalFromLastNote: <#T##value##Double#>)

setNotes(stringNumbers: [<#T##values##Int#>], fretNumbers: [<#T##values##Int#>])
playNotes(stringNumbers: [<#T##values##Int#>], intervalFromLastNote: <#T##value##Double#>)



/*:
 **"Music is the reminder that it is always possible to feel alright."**
 - John Mayer
 */
//#-end-editable-code
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, integer)
//#-code-completion(identifier, show, setNote)
