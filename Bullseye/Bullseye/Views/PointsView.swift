//
//  PointsView.swift
//  Bullseye
//
//  Created by Alina Costache on 6/13/22.
//

import SwiftUI

struct PointsView: View {
    @Binding var game: Game
    @Binding var sliderValue: Double
    @Binding var alertIsVisible: Bool
    
    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedValue )
        
        VStack(spacing: 10) {
            HStack {
                Spacer()
                Button(action: {
                    game.startNewRound(points: points)
                    withAnimation {
                        alertIsVisible = false
                    }
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(Color.gray)
                }
                .frame(width: 20, height: 20, alignment: .trailing)
            }
            InstructionsText(text: "THE SLIDERS VALUE IS")
            BigNumberText(text: String(Int(sliderValue.rounded()) ))
            BodyText(text: "You scored \(game.points(sliderValue: roundedValue )) Points\n 🎉🎉🎉")
            
            Button(action: {
                withAnimation {
                    alertIsVisible = false
                }
                game.startNewRound(points: points)
            }) {
                ButtonText(text: "Start New Round")
            }
        }
        .padding()
        .frame(maxWidth: 300)
        .background(
            Color.white
        )
        .cornerRadius(Constants.General.roundedRectCornerRadius)
        .shadow(radius: 10, x: 5, y: 5)
        .transition(.scale)
    }
}

struct PointsView_Previews: PreviewProvider {
    static private var alertIsVisible = Binding.constant(false)
    static private var sliderValue = Binding.constant(50.0)
    static private var game =  Binding.constant(Game())
    
    static var previews: some View {
        PointsView(game: game, sliderValue: sliderValue, alertIsVisible: alertIsVisible)
    }
}
