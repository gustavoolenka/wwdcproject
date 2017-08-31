//#-hidden-code
//
//  Contents.swift
//
//  Created by Gustavo Fonseca Olenka on 26/03/17.
//  Copyright © 2017 Gustavo Fonseca Olenka. All rights reserved.
//
//#-end-hidden-code
import PlaygroundSupport
import SpriteKit

let skView = SKView(frame: CGRect(x: 0, y: 0, width: 728, height: 1024))
let scene = GuitarScene(size: CGSize(width: 728, height: 1024))
skView.presentScene(scene)
scene.scaleMode = .aspectFill
PlaygroundPage.current.liveView = skView
scene.guitarExplanation()
