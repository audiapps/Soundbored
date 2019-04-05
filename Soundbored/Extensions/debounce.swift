//
//  debounce.swift
//  Soundbored
//
//  Created by Peter Bloxidge on 30/03/2019.
//  Copyright © 2019 Peter Bloxidge. All rights reserved.
//

import Foundation

func debounce(interval: TimeInterval, queue: DispatchQueue, action: @escaping (() -> Void)) -> () -> Void {
    var lastFireTime = DispatchTime.now()
    
    return {
        lastFireTime = DispatchTime.now()
        let dispatchTime = DispatchTime.now() + interval
        
        queue.asyncAfter(deadline: dispatchTime) {
            let when: DispatchTime = lastFireTime + interval
            let now = DispatchTime.now()
            if now.rawValue >= when.rawValue {
                action()
            }
        }
    }
}
