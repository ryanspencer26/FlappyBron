//
//  Powerup.swift
//  FlappyBron
//
//  Created by RYAN SPENCER on 3/4/25.
//

import Foundation

class Powerup {
    
    var buff: Int
    var position: (CGFloat, CGFloat)
    
    init(buff: Int, position: (CGFloat, CGFloat)) {
        self.buff = buff
        self.position = position
    }
    
}

class Curry: Powerup {
    
    // total spawns
    static var spawns = 0
    
    static var rarity = 4
    
    // milliseconds of delay
    static var inputDelay = 200
    
    init(position: (CGFloat, CGFloat)){
        super.init(buff: -1, position: position)
        Curry.spawns += 1
    }
    
}

class BronShoes: Powerup {
    
    // total spawns
    static var spawns = 0
    
    static var rarity = 1
    
    // change in jump velocity
    static var deltaJump = 50
    
    init(position: (CGFloat, CGFloat)){
        super.init(buff: 0, position: position)
        BronShoes.spawns += 1
    }
    
}

class Sunshine: Powerup {
    
    // total spawns
    static var spawns = 0
    
    static var rarity = 5
    
    static var immunity = true
    static var deltaSpeed = 50
    
    init(position: (CGFloat, CGFloat)){
        super.init(buff: 1, position: position)
        Sunshine.spawns += 1
    }
    
}

class MediaChaos: Powerup {
    
    static var spawns = 0
    
    static var rarity = 2
    
    static var lights = true
    
    init(position: (CGFloat, CGFloat)){
        super.init(buff: -1, position: position)
        MediaChaos.spawns += 1
    }
    
}

class KingsFocus: Powerup {
    
    static var spawns = 0
    
    static var rarity = 3
    
    // change in wall speed
    static var deltaSpeed = -250
    
    init(position: (CGFloat, CGFloat)){
        super.init(buff: 1, position: position)
        KingsFocus.spawns += 1
    }
    
}
