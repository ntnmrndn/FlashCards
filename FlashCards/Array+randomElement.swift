//
//  Array+randomElement.swift
//  FlashCards
//
//  Created by Antoine Marandon on 19/07/2015.
//  Copyright (c) 2015 Antoine Marandon. All rights reserved.
//

import Foundation

extension Array {
    //XXX swift 2.0 should do better.
    var randomObject: T {
        let random = Int(arc4random_uniform(UInt32(count)))
        return self[random]
    }
}