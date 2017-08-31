//
//  GuitarString.swift
//  wwdcSK
//
//  Created by Gustavo Fonseca Olenka on 27/03/17.
//  Copyright © 2017 Gustavo Fonseca Olenka. All rights reserved.
//

import Foundation

public class GuitarString {
    
    public let guitarStringNoteValue:Int
    public var guitarStringSelectedFret:Int
    public var guitarStringIsPlaying:Bool
    public var guitarStringIsVibrating:Bool

    public var guitarStringSoundSimulator:GuitarSoundSimulator
    public let guitarStringNumber:Int
    
    public init(noteValue:Int, selectedFret:Int, isPlaying:Bool,soundSimulator: GuitarSoundSimulator){
        self.guitarStringNoteValue = noteValue
        self.guitarStringSelectedFret = selectedFret
        self.guitarStringIsPlaying = isPlaying
        self.guitarStringSoundSimulator = soundSimulator
        self.guitarStringIsVibrating = false
        
        switch noteValue{
            case 64:
                guitarStringNumber = 1
            case 59:
                guitarStringNumber = 2
            case 55:
                guitarStringNumber = 3
            case 50:
                guitarStringNumber = 4
            case 45:
                guitarStringNumber = 5
            case 40:
                guitarStringNumber = 6
            default:
                guitarStringNumber = 0
        }
    }
}
