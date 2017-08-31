//
//  GuitarSoundSimulator.swift
//  wwdcSK
//
//  Created by Gustavo Fonseca Olenka on 27/03/17.
//  Copyright © 2017 Gustavo Fonseca Olenka. All rights reserved.
//

import Foundation
import SpriteKit
import AVFoundation
import UIKit

public class GuitarSoundSimulator {
    // Scene Reference
    public var guitarScene:GuitarScene?
    
    // Guitar Strings atributes
    public var guitarStrings:[GuitarString] = []
    
    //Play List
    public var notesToPlay:[Int] = [] // Note Array to Play
    public var stringsToPlay:[Int] = [] // String Array to Play
    public var timeIntervalsToPlay:[Double] = []
    public var totalTime:Double = 0.0
    public var currentToPlay = 0
    
    // Audio Engine Declaration
    public var audioEngine:AVAudioEngine!
    public var audioSampler:AVAudioUnitSampler!
    
    let melodicBank = UInt8(kAUSampler_DefaultMelodicBankMSB)
    let defaultBankLSB = UInt8(kAUSampler_DefaultBankLSB)
    
    // general midi number for guitar (each number, from 1 to 127, is a different instrument, check program change table
    let gmClassicalGuitar = UInt8(25)
    
    public init (){
        initStrings()
        
        // start audio engine e sampler
        audioEngine = AVAudioEngine()
        
        audioSampler = AVAudioUnitSampler()
        audioEngine.attach(audioSampler)
        
        audioEngine.connect(audioSampler, to: audioEngine.mainMixerNode, format: nil)
        
        if audioEngine.isRunning {
            print("audio engine already started")
            return
        }
        do {
            try audioEngine.start()
            print("audio engine started")
        } catch {
            print("oops \(error)")
            print("could not start audio engine")
        }
        loadPatch(gmClassicalGuitar)
    }
    
    private func initStrings(){
        
        let string1 = GuitarString(noteValue: 64, selectedFret: 0, isPlaying: false, /*noteDuration: 0.0,*/ soundSimulator: self) //e
        let string2 = GuitarString(noteValue: 59, selectedFret: 0, isPlaying: false, /*noteDuration: 0.0,*/ soundSimulator: self) //B
        let string3 = GuitarString(noteValue: 55, selectedFret: 0, isPlaying: false, /*noteDuration: 0.0,*/ soundSimulator: self) //G
        let string4 = GuitarString(noteValue: 50, selectedFret: 0, isPlaying: false, /*noteDuration: 0.0,*/ soundSimulator: self) //D
        let string5 = GuitarString(noteValue: 45, selectedFret: 0, isPlaying: false, /*noteDuration: 0.0,*/ soundSimulator: self) //A
        let string6 = GuitarString(noteValue: 40, selectedFret: 0, isPlaying: false, /*noteDuration: 0.0,*/ soundSimulator: self) //E
        
        self.guitarStrings.append(string1)
        self.guitarStrings.append(string2)
        self.guitarStrings.append(string3)
        self.guitarStrings.append(string4)
        self.guitarStrings.append(string5)
        self.guitarStrings.append(string6)
    }
    
    private func loadPatch(_ gmpatch:UInt8, channel:UInt8 = 0) {
        guard let soundbank =
            Bundle.main.url(forResource: "gs_instruments", withExtension: "dls")
            else {
                print("could not read sound font")
                return
        }
        do {
            try audioSampler.loadSoundBankInstrument(at: soundbank, program:gmpatch, bankMSB: melodicBank, bankLSB: defaultBankLSB)
        }
        catch let error as NSError {
            print("\(error.localizedDescription)")
            return
        }
        
        self.audioSampler.sendProgramChange(gmpatch, bankMSB: melodicBank, bankLSB: defaultBankLSB, onChannel: channel)
    }
    
    
    
    public func setNote(stringNumber:Int, fratNumber:Int){
        if (stringNumber > 0 && stringNumber < 7){
            self.notesToPlay.append(fratNumber)
            self.guitarStrings[stringNumber - 1].guitarStringSelectedFret = fratNumber
        }
    }
    
    public func setNotes(stringNumbers:[Int], fratNumbers:[Int]){
        if (stringNumbers.count == fratNumbers.count){
            for i in 0...stringNumbers.count - 1{
//                if ((stringNumbers[i] > 0 && stringNumbers[i] < 7)){
                    self.notesToPlay.append(fratNumbers[i])
                    self.guitarStrings[stringNumbers[i] - 1].guitarStringSelectedFret = fratNumbers[i]
//                }
            }
        }
        else{
            print("Number of strings and frats is not the same")
        }
    }
    
    @objc func produceSound (){
        
        if self.guitarStrings[stringsToPlay[self.currentToPlay] - 1].guitarStringIsPlaying == false{
            self.guitarScene?.vibrateString(stringNumber: stringsToPlay[self.currentToPlay])
            self.audioSampler.startNote(UInt8( self.guitarStrings[stringsToPlay[self.currentToPlay] - 1].guitarStringNoteValue + self.notesToPlay[currentToPlay]), withVelocity: 127, onChannel: UInt8(stringsToPlay[self.currentToPlay]))
            self.guitarStrings[stringsToPlay[self.currentToPlay] - 1].guitarStringIsPlaying = true
            self.guitarStrings[stringsToPlay[self.currentToPlay] - 1].guitarStringIsPlaying = false
            self.currentToPlay += 1
        }
        
    }
    
    public func playNoteOnScreen(stringNumber:Int, intervalFromLastNote:TimeInterval){
        if self.guitarStrings[stringNumber - 1].guitarStringIsPlaying == false{
            self.guitarScene?.vibrateString(stringNumber: stringNumber)
            
            self.audioSampler.startNote(UInt8( self.guitarStrings[stringNumber - 1].guitarStringNoteValue + self.guitarStrings[stringNumber - 1].guitarStringSelectedFret), withVelocity: 127, onChannel: UInt8(stringNumber))
            
            self.guitarStrings[stringNumber - 1].guitarStringIsPlaying = true
            
            
            usleep(useconds_t(Int(intervalFromLastNote * 1000000)))
            
            self.guitarStrings[stringNumber - 1].guitarStringIsPlaying = false
            
        }
    }
    
    public func playNote(stringNumber:Int, intervalFromLastNote:TimeInterval){
        if (stringNumber > 0 && stringNumber < 7){
            self.stringsToPlay.append(stringNumber)
            self.timeIntervalsToPlay.append(self.totalTime)
            
            self.totalTime += intervalFromLastNote
            
            Timer.scheduledTimer(timeInterval: self.totalTime, target: self, selector: #selector(GuitarSoundSimulator.produceSound), userInfo: nil, repeats: false)
        }
    }
    
    public func playNotes(stringNumbers:[Int], intervalFromLastNote:TimeInterval){
        for gs in stringNumbers{
//            if (gs > 0 && gs < 7){
                self.stringsToPlay.append(gs)
                self.timeIntervalsToPlay.append(self.totalTime)
//            }
        }
        self.totalTime += intervalFromLastNote
        
        for i in 0...stringNumbers.count-1{
//            if (stringNumbers[i] > 0 && stringNumbers[i] < 7){
                Timer.scheduledTimer(timeInterval: self.totalTime, target: self, selector: #selector(GuitarSoundSimulator.produceSound), userInfo: nil, repeats: false)
//            }
        }
    }
    
//    public func blockScreen(){
//        guitarScene?.view?.isUserInteractionEnabled = false
//        Timer.scheduledTimer(timeInterval: self.totalTime + 0.1, target: self, selector: #selector(GuitarSoundSimulator.unblock), userInfo: nil, repeats: false)
//    }
//    
//    @objc private func unblock(){
//        guitarScene?.view?.isUserInteractionEnabled = true
//    }
    
    public func resetMusicSequence(){
        self.notesToPlay.removeAll()
        self.stringsToPlay.removeAll()
        self.timeIntervalsToPlay.removeAll()
        self.totalTime = 0.0
        self.currentToPlay = 0
    }
}
