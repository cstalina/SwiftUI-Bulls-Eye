//
//  Game.swift
//  Bullseye
//
//  Created by Alina Costache on 6/8/22.
//

import Foundation

struct Game {
    
    var target = Int.random(in: 1...100 ) //target value
    var score = 0
    var round = 1 //current round
    var leaderboardEntries: [LeaderboardEntry] = []
    
    func points(sliderValue: Int) -> Int { //points won in round
        let difference = abs(self.target - sliderValue)
        var bonus: Int = 0
        
        if difference == 0 {
           bonus = 100
        } else if difference <= 2 {
            bonus = 50
        }
        
        return 100 - difference + bonus
    }

    mutating func addToLeaderboard(points: Int) {
        self.leaderboardEntries.append(LeaderboardEntry(score: score, date: Date()))
        leaderboardEntries.sort(by: { $0.score > $1.score })
    }
    
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = Int.random(in: 1...100)
        self.addToLeaderboard(points: points)
    }
    
    mutating func restart() {
        target = Int.random(in: 1...100 )
        round = 1
        score = 0
    }
}


struct LeaderboardEntry {
    let score: Int
    let date: Date
}
