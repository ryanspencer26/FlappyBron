//
//  Player.swift
//  FlappyBron
//
//  Created by RYAN SPENCER on 3/6/25.
//

import Foundation

class Player : Codable{
    
    var username: String
    var highScore: Int
    var RP: Int
    var userID: String
    var rank: Int
    
    init(username: String) {
        self.userID = ""
        self.username = username
        highScore = 0
        RP = 0
        rank = 0

    }
    
    public static func save(){
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(AppData.player) {
            
            UserDefaults.standard.set(encoded, forKey: "player")
            
        }
        
    }
    
}
