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
        VStack {
            VStack {
                Text("🎯🎯🎯\nPUT THE BULLSYE AS CLOSE AS YOU CAN TO")
                    .bold()
                    .kerning(2.0)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4.0)
                    .font(.footnote)
                
                Text(String(game.target))
                    .kerning(-1.0)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(Color(red: 25.0/225, green: 25.0/225, blue: 25.0/225, opacity: 1.0))

                HStack {
                    Text("1")
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 25.0/225, green: 25.0/225, blue: 25.0/225, opacity: 1.0))

                    Slider(value: self.$sliderValue, in: 1.0...100)
                    
                    Text("100")
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 25.0/225, green: 25.0/225, blue: 25.0/225, opacity: 1.0))
                    
                }
            }
            Button("Hit me") {
                self.alertIsVisible = true
            }.alert("", isPresented: $alertIsVisible) {
                Button("Awesome") {}
            } message: {
                let roundedValue = Int(self.sliderValue.rounded())
                Text("The value is \(roundedValue).\n You have won \(game.points(sliderValue: roundedValue )) points this round!")
            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portraitUpsideDown)
        ContentView().previewLayout(.fixed(width: 568, height: 320))
    }
}
