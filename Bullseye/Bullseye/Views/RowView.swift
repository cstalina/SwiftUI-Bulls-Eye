//
//  RowView.swift
//  Bullseye
//
//  Created by Alina Costache on 6/13/22.
//

import SwiftUI

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date
    
    var body: some View {
        HStack() {
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(score: score)
            Spacer()
            DateText(date: date)
        }
        .background(
            RoundedRectangle(
                cornerRadius: .infinity
            )
            .strokeBorder(
                Color("buttonStrokeColor"),
                lineWidth: Constants.General.strokeWidth
            )
        )
        .frame(height: Constants.Leaderboard.rowHeight)
        .padding(.leading)
        .padding(.trailing)
    }
}
