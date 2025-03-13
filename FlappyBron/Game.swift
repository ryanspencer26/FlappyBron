//
//  Game.swift
//  FlappyBron
//
//  Created by SEAN MCCAIN on 3/6/25.
//

import Foundation

class Game : Codable{
    
    var score : Int
//    var sunshineSpawns : Int
//    var currySpawns : Int
//    var lebronsSpawns: Int
    
    //, sunshineSpawns: Int, currySpawns: Int, lebronsSpawns: Int -- COPY INTO INIT WHEN READY TO USE
    
    init(score: Int) {
        self.score = score
//        self.sunshineSpawns = sunshineSpawns
//        self.currySpawns = currySpawns
//        self.lebronsSpawns = lebronsSpawns
    }
    
}
