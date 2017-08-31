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
PlaygroundPage.current.liveView = skView

public func playGravity() {
    scene.playGravity()
}

public func playThinkingOutLoud() {
    scene.playThinkingOutLoud()
}

public func playFreeFallin(){
    scene.playFreeFallin()
}

public func playUnderTheBridge(){
    scene.playUnderTheBridge()
}

public func playBeatIt(){
    scene.playBeatIt()
}

public func playSong(number: Int){
    if number == 1{
        playGravity()
    }
    else if number == 2{
        playThinkingOutLoud()
    }
    else if number == 3{
        playFreeFallin()
    }
    else if number == 4{
        playUnderTheBridge()
    }
    else if number == 5{
        playBeatIt()
    }
}
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, 1, 2, 3, 4)
//#-end-hidden-code
/*:
 # Time to jump into music !!!
 
 **Check it out what you can do!**
 
 Here are some samples that I made for you to try, just use the method playSong selecting the corresponding number to play them!
 
 Choose Your Song:
 1. Gravity (Intro) - John Mayer
 2. Thinking Out Loud (Melody) - Ed Sheeran
 3. Free Falling (Intro) - Tom Petty
 4. Under the Bridge (Intro) - Red Hot Chilli Peppers
 5. Beat It (Intro) - Michael Jackson
 
 Try playing one of the songs and than moving to next page.
 */

playSong(number:/*#-editable-code*/<#T##number##Int#>/*#-end-editable-code*/)


