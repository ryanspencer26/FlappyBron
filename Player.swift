//
//  Player.swift
//  FlappyBron
//
//  Created by RYAN SPENCER on 3/6/25.
//

import Foundation

class Player {
    
    var username: String
    var highScore: Int
    var RP: Int
    var userID: String
    var rank: Int
    
    init(userID: String) {
        self.userID = userID
        username = "John Doe"
        highScore = 0
        RP = 0
        if RP >= 1000 {
            rank = 1
        } else if RP >= 3000 {
            rank = 2
        } else if RP >= 6000 {
            rank = 3
        } else if RP >= 10000 {
            rank = 4
        } else if RP >= 15000 {
            rank = 5
        } else if RP >= 25000 {
            rank = 6
        } else {
            rank = 0
        }
    }
    
}
