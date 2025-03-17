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
    var games : [Game]
    var scoreRank: Int
    var rpRank: Int
    
    init(username: String) {
        self.userID = ""
        self.username = username
        highScore = 0
        RP = 0
        rank = 0
        games = [Game]()
        scoreRank = 0
        rpRank = 0
    }
    
    func addRP(RP: Int){
        self.RP += RP
        updateRank()
    }
    
    func updateRank(){
        
        if RP >= 25000 {
            rank = 6
        } else if RP >= 15000 {
            rank = 5
        } else if RP >= 10000 {
            rank = 4
        } else if RP >= 6000 {
            rank = 3
        } else if RP >= 3000 {
            rank = 2
        } else if RP >= 1000 {
            rank = 1
        } else {
            rank = 0
        }
        
    }
    
    public static func save(){
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(AppData.player) {
            
            UserDefaults.standard.set(encoded, forKey: "player")
            
        }
        
    }
    
}
