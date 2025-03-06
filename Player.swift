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
    
    init(userID: String) {
        self.userID = userID
        username = "John Doe"
        highScore = 0
        RP = 0
    }
    
}
