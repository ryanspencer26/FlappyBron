//
//  Game.swift
//  FlappyBron
//
//  Created by SEAN MCCAIN on 3/6/25.
//

import Foundation

class Game{
    
    var score : Int
    //var RPIncrement : Int
    var sunshineSpawns : Int
    var currySpawns : Int
    var lebronsSpawns: Int
    
    init(score: Int, sunshineSpawns: Int, currySpawns: Int, lebronsSpawns: Int) {
        self.score = score
        self.sunshineSpawns = sunshineSpawns
        self.currySpawns = currySpawns
        self.lebronsSpawns = lebronsSpawns
        Sunshine.spawns = 0
        Curry.spawns = 0
        BronShoes.spawns = 0
    }
    
}
