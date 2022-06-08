//
//  BullseyeTests.swift
//  BullseyeTests
//
//  Created by Alina Costache on 6/6/22.
//

import XCTest
@testable import Bullseye

class BullseyeTests: XCTestCase {
    
    var game: Game!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        game = Game()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        game = nil
    }
    
    func testScorePositive() {
        let guess = game.target + 5 // the user scores with 5 more than the actual value of the slider
        let score = game.points(sliderValue: guess)
        //maximum points - 100 and we substract the difference between 100 and the error (in this care 5)
        XCTAssertEqual(score, 95)
    }
    
    func testNegative() {
        let guess = game.target - 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
}
