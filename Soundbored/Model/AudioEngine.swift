//
//  SBAudioEngine.swift
//  Soundbored
//
//  Created by Peter Bloxidge on 27/03/2019.
//  Copyright © 2019 Peter Bloxidge. All rights reserved.
//

import Foundation
import AudioKit

class AudioEngine {
    
    static let instance = AudioEngine()
    
    let mixer = AKMixer()
    
    init() {
        AudioKit.output = mixer
        try! AudioKit.start()
    }
}
