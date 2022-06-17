//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Alina Costache on 6/13/22.
//

import SwiftUI

struct LeaderboardView: View {
    @Binding var leaderboardIsShowing: Bool
    @Binding var game: Game

    var body: some View {
        ZStack {
            Color("backgroundColor").edgesIgnoringSafeArea(.all)
            VStack(spacing: 10) {
                HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
                LabelView()
                VStack(spacing: 10) {
                    ForEach(game.leaderboardEntries.indices) { i in
                        let leaderboardEntry = game.leaderboardEntries[i]
                        RowView(index: i+1, score: leaderboardEntry.score, date: leaderboardEntry.date)

                    }
                }
            }
        }
    }
}

struct BigBoldText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .kerning(2.0)
            .foregroundColor(Color("textColor"))
            .font(.title)
            .fontWeight(.black)
    }
}


struct HeaderView: View {
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Binding var leaderboardIsShowing: Bool
    
    var body: some View {
        ZStack {
            if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                BigNumberText(text: "Leaderboard")
                    .padding(.leading)
                Spacer()
            } else {
                BigNumberText(text: "Leaderboard")
            }
            HStack {
                Spacer()
                Button(action:{
                    leaderboardIsShowing = false
                }) {
                    RoundedImageViewFilled(systemName: "xmark")
                        .padding(.trailing)
                }
            }
        }
    }
}

struct LabelView: View {
    
    var body: some View {
        HStack {
            Spacer()
                .frame(width: Constants.General.roundedViewLength)
            Spacer()

            LabelTextView(text: "Score")
                .frame(width: Constants.Leaderboard.scoreColWidth)
            Spacer()

            LabelTextView(text: "Date")
                .frame(width: Constants.Leaderboard.dateColWidth)
        }
        .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
        .padding(.leading)
        .padding(.trailing)
    }
}

struct LeaderboardView_Previews: PreviewProvider {

    static private var leaderboardIsShowing = Binding.constant(false)
    static private var game = Binding.constant(Game())

    static var previews: some View {
        LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
        LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game).previewInterfaceOrientation(.landscapeRight)
            .preferredColorScheme(.dark)
    }
}
