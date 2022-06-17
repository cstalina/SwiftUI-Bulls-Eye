//
//  ContentView.swift
//  Bullseye
//
//  Created by Alina Costache on 6/6/22.
//

import SwiftUI

struct ContentView: View {
    @State private  var alertIsVisible: Bool = false//state == whenever the state changes, the ui changes (it refreshes by itself), must have initial value
    @State private var sliderValue: Double = 50.0
    @State private var game = Game()
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            .edgesIgnoringSafeArea(.all)
            VStack {
                InstructionsView(game: $game)
                    .padding(.bottom, alertIsVisible ? 0 : 100.0)
                if alertIsVisible {
                    PointsView(game: $game, sliderValue: $sliderValue, alertIsVisible: $alertIsVisible)
                        .transition(.scale)
                } else {
                    HitMeButton(alertIsVisible: $alertIsVisible, game: $game, sliderValue: $sliderValue)
                        .transition(.scale)
                }
                
            }.padding()
            if !alertIsVisible {
                SliderView(sliderValue: $sliderValue)
                    .transition(.scale)
            }
        }
    }
}

struct InstructionsView:View {
    @Binding var game: Game // no need to set an initial value, it will be passed in
    
    var body: some View {
        VStack {
            InstructionsText(text:"🎯🎯🎯\nPUT THE BULLSYE AS CLOSE AS YOU CAN TO")
                .padding(.leading, 30.0)
                .padding(.trailing, 30.0)
            BigNumberText(text: String(game.target))
        }
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            SliderLabelText(text: "1")
            Slider(value: $sliderValue, in: 1.0...100.0)
            SliderLabelText(text: "100")
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
        ContentView().preferredColorScheme(.light)

    }
}
