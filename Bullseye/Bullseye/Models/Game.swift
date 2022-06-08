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
    
    func points(sliderValue: Int) -> Int { //points won in round
        100 - abs(self.target - sliderValue) //100 = max points scored
    }

}
