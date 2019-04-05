//
//  AKAudioFile+seconds.swift
//  Soundbored
//
//  Created by Peter Bloxidge on 29/03/2019.
//  Copyright © 2019 Peter Bloxidge. All rights reserved.
//

import Foundation
import AudioKit

extension AKAudioFile {
    var seconds: TimeInterval {
        return Double(self.samplesCount) / self.sampleRate
    }
    
    var milliseconds: TimeInterval {
        return self.seconds * 1000
    }
}
